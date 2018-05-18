<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
    <head>
        <meta http-equiv="Content-type" content="text/html; charset=utf-8">
        <link rel="stylesheet" href="/css/default.css" type="text/css" media="screen" charset="utf-8" />
        <title>Online Banking Demo: Login</title>
    </head>

    <body>
        <h1>Online Banking: Authentification</h1>

        <!-- Contiendra notre logo-->
        <div class="img-container">
            <p><img id="logo" src="/static/logo.jpg" title="OnlineBanking_Logo" /></p>
        </div><!-- img-container -->

        <!-- Contiendra notre formulaire de login -->
        <div class="formulaire">
            <form method="POST" action="/login">
                <label for="UserName">User Name:</label>
                <input name="name"  id="UserName"    type="text"  />
                <label for="UserPassword">User Password:</label>
                <input name="password" id="UserPassword" type="password" />
                <input type="submit" name="login" id="LoginButton" />
              </form>
        </div><!-- formulaire -->

    </body>
</html>
