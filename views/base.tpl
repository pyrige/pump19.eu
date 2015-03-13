<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Pump19 &#124; {{ subtitle }}</title>
    <link rel="stylesheet" href="/static/css/mini.css">
    <link rel="icon" type="image/gif" href="data:image/gif;base64,R0lGODlhEAAQAOMJAAABACcgFkE2IllMMnJiQop3Uf92AP+pAP/MBv///////////////////////////yH5BAEKAA8ALAAAAAAQABAAAARf8MkHqrVzAjGIJ0UIZNvQfZ4olSeajhQ3CEFN0HVRyYNxGAGCD6gDBAScA+IQGCiZRRpnaBoKokeTidfRxTgfpODj3cgIrZP3a6q5QeuYKVWgw9jdkIqEVO8zFBcYEhEAOw==">
  </head>
  <body>
    <nav class="navbar navbar-default navbar-static-top">
      <div class="container">
        <div class="navbar-header">
          <a class="navbar-brand" href="/"><span class="fa fa-twitch"></span> Pump19</a>
        </div>
        <ul class="nav navbar-nav">
          % if get("active") == "commands":
            <li class="active">
              <a href="#">
                <i class="fa fa-keyboard-o"></i>&nbsp;Commands
              </a>
            </li>
          % else:
            <li>
              <a href="/commands">
                <i class="fa fa-keyboard-o"></i>&nbsp;Commands
              </a>
            </li>
          % end
          % if get("active") == "quotes":
            <li class="active">
              <a href="#">
                <i class="fa fa-comment-o"></i>&nbsp;Quotes
              </a>
            </li>
          % else:
            <li>
              <a href="/quotes/">
                <i class="fa fa-comment-o"></i>&nbsp;Quotes
              </a>
            </li>
          % end
        </ul>
      </div>
    </nav>

    <div class="container">
      {{!base}}
    </div>

    <footer class="container text-center text-muted">
      <p><small>
        &copy; 2015 Twisted Pear<br>
        Powered by
        <a href="http://getbootstrap.com/">Bootstrap</a> (<a href="http://bootswatch.com/slate/">Slate</a> Theme)
        and
        <a href="https://fortawesome.github.io/Font-Awesome/"><i class="fa fa-flag"></i>&nbsp;Font Awesome</a>
      </small></p>
    </footer>
  </body>
</html>
