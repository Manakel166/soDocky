<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
    <head>
        <meta http-equiv="Content-type" content="text/html; charset=utf-8">
        <link rel="stylesheet" href="/css/default.css" type="text/css" media="screen" charset="utf-8" />
        <title>Online Banking Demo: Transfer</title>
    </head>

    <body>
        <h1>Online Banking: Make a Fund transfer</h1>

        <!-- Contiendra notre logo-->
        <div class="img-container">
            <p><img id="logo" src="/static/logo.jpg" title="OnlineBanking_Logo" /></p>
        </div><!-- img-container -->

        <!-- Contiendra notre formulaire de transfer -->
        <div class="formulaire">
            <form method="POST" action="/transfer">
               <label for="PayeesList">Choose Payee:</label>
               <SELECT name="payee" id="PayeesList">
                    % for payee in payees.keys():
                    <OPTION value="{{payee}}"
                        % if payee == defaults['payee']:
                            selected="selected"
                        % end
                        >{{payee}}
                    </option>
                   %end
               <label for="Amount">Amount in $:</label>
               <input name="amount"  id="Amount"    type="number"  />
               <input type="submit" id="SubmitTransfer" />
            </form>
        </div><!-- formulaire -->

    </body>
</html>

              </form>
        </div><!-- formulaire -->

    </body>
</html>
