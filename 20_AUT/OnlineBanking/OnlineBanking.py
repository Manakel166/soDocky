from bottle import route, run
from bottle import static_file
from bottle import view

#for REST API
from bottle import request, response
from bottle import post, get, put, delete

import re, json	


from bottle import redirect


user_name='Manakel'
user_pswd='robert'
payees_dict={'Pierre(R)':'Registered','Paul(N)':'Not_Registered','Jacques(R)':'Registered'}
deposit=200
deposit_dict={'Georges':100,'Pierre':50}





def validate_transfer(in_payee,in_amount):
    if  payees_dict[in_payee]=='Not_Registered':
        return ["ERROR","PAYEE_NOT_REGISTERED"]
    else:
        if int(in_amount)>deposit:
            return["ERROR","AMOUNT_TOO_BIG"]
        else:
            return["SUCCESS",str(in_amount)]


def authenticate(in_user_name,in_user_pswd):
    if user_name<>in_user_name:
        return False
    else:
        if in_user_pswd<>user_pswd:
            return False
        else:
            return True






@route('/hello')
def hello():
    return "Hello World!"


@route('/status')
@route('/status/<name>')
@view('server_status')
def server_status(name='Unknown'):
    return dict(name=name)

@route('/')
@view('homepage')
def homepage():
    return dict()

@get('/login') # or @route('/login')
@view('login')
def login_form():
    return dict()

@post('/login') # or @route('/login', method='POST')
def login_submit():
    username     = request.forms.get('name')
    password = request.forms.get('password')
    if authenticate(username, password):
        response.set_cookie("user", username, secret='some-secret-key')
        redirect("/")
        return "Welcome %s! You are now logged in." % username



    else:
        return "<div id=ErrorLogin><p>Login failed</p></div>"


@get('/transfer')
@view('transfer')
def transfer_form():
    username = request.get_cookie("user", secret='some-secret-key')
    if username:
        return dict(payees=payees_dict,defaults={'payee':'Paul(N)'},user=username)
    else:
        return "You are not logged in. Access denied."


@post('/transfer')
def transfer_submit():
    payee=request.forms.get('payee')
    amount=request.forms.get('amount')
    status=validate_transfer(payee, amount)
    if status[0]=="SUCCESS":
        return "TRANSFERT VALIDATED"
    else:
        return "ERROR:"+status[1]

@route('/static/<filename:path>')
@route('/image/<filename:path>')
def send_static(filename):
    return static_file(filename, root='./static/')

@route('/css/:filename')
def render_css(filename):
    return static_file(filename,root='./static/')

@post('/api/transfer')
def creation_handler():
    '''Handles payees creation'''

    try:
        # parse input data
        try:
            data = request.json
        except:
            raise ValueError

        if data is None:
            raise ValueError

        # extract and validate payee and amount
        try:
		   
			payee = data['payee']
			amount= data['amount']
			status=validate_transfer(payee, amount)
		
			if status[0]=="SUCCESS":
				# return 200 Success
				response.headers['Content-Type'] = 'application/json'
				return json.dumps({'status': 'TRANSFER VALIDATED'})
			else:
				response.status=422  #data is understood but the transaction requested is not valid
				return json.dumps({'status': status[1]})
			
        except (TypeError, KeyError):
            raise ValueError
			
		
		

    except ValueError:
        # if bad request data, return 400 Bad Request
        response.status = 400
        return
    
    except KeyError:
        # if name already exists, return 409 Conflict
        response.status = 409
        return

    # add name
	print name
	payees_dict.update(name)
	if name.endswith("(R)"):
		payees_dict[name]="Registered"
	if name.endswith("(N)"):
		payees_dict[name]="Not_Registered"
	
    # return 200 Success
    response.headers['Content-Type'] = 'application/json'
    return json.dumps({'name': name})

@post('/api/payees')
def creation_handler():
    '''Handles payees creation'''

    try:
        # parse input data
        try:
            data = request.json
        except:
            raise ValueError

        if data is None:
            raise ValueError

        # extract and validate name
        try:
		   
			name = data['name']
			if not (name.endswith("(R)") | name.endswith("(N)")):
				raise ValueError
			  # add name
			print name
			if name.endswith("(R)"):
				payees_dict[name]="Registered"
			if name.endswith("(N)"):
				payees_dict[name]="Not_Registered"
			# return 200 Success
			response.headers['Content-Type'] = 'application/json'
			return json.dumps({'name': name})
        except (TypeError, KeyError):
            raise ValueError

        # check for existence
        if name in payees_dict:
            raise KeyError

    except ValueError:
        # if bad request data, return 400 Bad Request
        response.status = 400
        return
    
    except KeyError:
        # if name already exists, return 409 Conflict
        response.status = 409
        return

  

@get('/api/payees')
def listing_handler():
    '''Handles name listing'''

    response.headers['Content-Type'] = 'application/json'
    response.headers['Cache-Control'] = 'no-cache'
    return json.dumps({'payees': payees_dict})

#bottle.TEMPLATE_PATH.insert(0, 'views')
run(host='localhost', port=1026, debug=True,reloader=False)


