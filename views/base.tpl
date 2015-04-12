<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Pump19 &#124; {{ subtitle }}</title>
    <link rel="stylesheet" href="/static/css/mini.css">
    <link rel="icon" type="image/gif" href="data:image/gif;base64,R0lGODlhEAAQAOMJAAABACcgFkE2IllMMnJiQop3Uf92AP+pAP/MBv///////////////////////////yH5BAEKAA8ALAAAAAAQABAAAARf8MkHqrVzAjGIJ0UIZNvQfZ4olSeajhQ3CEFN0HVRyYNxGAGCD6gDBAScA+IQGCiZRRpnaBoKokeTidfRxTgfpODj3cgIrZP3a6q5QeuYKVWgw9jdkIqEVO8zFBcYEhEAOw==">
  </head>
  <body>
    <header>
      <nav class="navbar navbar-default navbar-static-top">
        <div class="container">
          <div class="navbar-header">
            <a class="navbar-brand" href="/"><span class="fa fa-twitch"></span> Pump19</a>
          </div>
          <ul class="nav navbar-nav">
            <li{{!" class=\"active\"" if get("active") == "commands" else ""}}>
              <a href="/commands"><i class="fa fa-keyboard-o"></i>&nbsp;Commands</a>
            </li>
            <li{{!" class=\"active\"" if get("active") == "quotes" else ""}}>
              <a href="/quotes/"><i class="fa fa-comment-o"></i>&nbsp;Quotes</a>
            </li>
            <li>
              <a href="http://git.io/A29Y"><i class="fa fa-github-square"></i>&nbsp;Issues</a>
            </li>
          </ul>
          <ul class="nav navbar-nav navbar-right">
          % if session.get("logged_in", False):
            <p class="navbar-text">
              Signed in as <span class="text-capitalize text-info">{{session.get("user_name")}}</span>
            </p>
            <li>
              <a href="/logout"><i class="fa fa-sign-out"></i>&nbsp;Log out</a>
            </li>
          % else:
            <li{{!" class=\"active\"" if get("active") == "login" else ""}}>
              <a href="/login"><i class="fa fa-sign-in"></i>&nbsp;Log in</a>
            </li>
          % end
          </ul>
        </div>
      </nav>
    </header>

    <div class="container">
      {{!base}}
    </div>

    <footer class="container text-center text-muted">
      <p><small>
        &copy; 2015 Twisted Pear
        <a href="bitcoin:15bJMTjnQxtsyfr8Xsu4dePtSZtoC2qkFY">
          <i class="fa fa-btc"></i>15bJMTjnQxtsyfr8Xsu4dePtSZtoC2qkFY
        </a>
        <br>
        Powered by
        <a href="http://getbootstrap.com/">Bootstrap</a> (<a href="http://bootswatch.com/slate/">Slate</a> Theme)
        and
        <a href="https://fortawesome.github.io/Font-Awesome/"><i class="fa fa-flag"></i>&nbsp;Font Awesome</a>
      </small></p>
    </footer>
  </body>
</html>
