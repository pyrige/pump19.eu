<!DOCTYPE html>
<html class="no-js" lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Pump19 &#124; {{ subtitle }}</title>
    <link rel="icon" type="image/gif" href="data:image/gif;base64,R0lGODlhEAAQAOMJAAABACcgFkE2IllMMnJiQop3Uf92AP+pAP/MBv///////////////////////////yH5BAEKAA8ALAAAAAAQABAAAARf8MkHqrVzAjGIJ0UIZNvQfZ4olSeajhQ3CEFN0HVRyYNxGAGCD6gDBAScA+IQGCiZRRpnaBoKokeTidfRxTgfpODj3cgIrZP3a6q5QeuYKVWgw9jdkIqEVO8zFBcYEhEAOw==">

    <link rel="stylesheet" href="/static/css/app.css">
  </head>
  <body>
    <header class="expanded row align-center">
      <nav class="column top-bar">
        <div class="top-bar-left">
          <ul class="menu icon-top">
            <li{{!" class=\"active\"" if get("active") == "home" else ""}}>
              <a href="/">
                <i class="fa fa-twitch"></i>
                <span>Pump19</span>
              </a>
            </li>
            <li{{!" class=\"active\"" if get("active") == "commands" else ""}}>
              <a href="/commands">
                <i class="fa fa-keyboard-o"></i>
                <span>Commands</span>
              </a>
            </li>
            <li{{!" class=\"active\"" if get("active") == "codefall" else ""}}>
              <a href="/codefall">
                <i class="fa fa-gift"></i>
                <span>Codefall</span>
              </a>
            </li>
            <li{{!" class=\"active\"" if get("active") == "bingo" else ""}}>
              <a href="/bingo">
                <i class="fa fa-puzzle-piece"></i>
                <span>Trope Bingo</span>
              </a>
            </li>
            <li{{!" class=\"active\"" if get("active") == "contribute" else ""}}>
              <a href="/contribute">
                <i class="fa fa-medkit"></i>
                <span>Contribute</span>
              </a>
            </li>
          </ul>
        </div>
        <div class="top-bar-right">
          <ul class="menu icon-top">
          % if session.get("logged_in", False):
            <li>
              <a href="/logout">
                <i class="fa fa-sign-out"></i>
                <span>Log out</span>
              </a>
            </li>
          % else:
            <li{{!" class=\"active\"" if get("active") == "login" else ""}}>
              <a href="/login">
                <i class="fa fa-sign-in"></i>
                <span>Log in</span>
              </a>
            </li>
          % end
          </ul>
        </div>
      </nav>
    </header>

    {{!base}}

    <footer class="text-center">
      <small>
        Powered by
        <a href="http://foundation.zurb.com/">Foundation</a>
        and
        <a href="https://fortawesome.github.io/Font-Awesome/">
          <i class="fa fa-flag"></i>
          Font Awesome
        </a>
        <br>
        <i class="fa fa-copyright"></i>
        2015-2017 Twisted Pear
      </small>
    </footer>

    <!-- JS components -->
    <script src="/static/js/app.js"></script>
    <%
      rc_sitekey = get("rc_sitekey")
      if rc_sitekey:
        include("captcha_js.tpl", sitekey=rc_sitekey)
      end
    %>
  </body>
</html>
