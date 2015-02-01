<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Pump19 &#124; {{ subtitle }}</title>
    <link rel="stylesheet" href="/static/css/mini.css">
  </head>
  <body>
    <nav class="navbar navbar-default navbar-static-top">
      <div class="container">
        <div class="navbar-header">
          <a class="navbar-brand" href="/"><span class="fa fa-twitch"></span> Pump19</a>
        </div>
        <ul class="nav navbar-nav">
          % if get("active") == "commands":
            <li class="active"><a href="#">Commands</a></li>
          % else:
            <li><a href="/commands">Commands</a></li>
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
        <a href="https://fortawesome.github.io/Font-Awesome/">Font Awesome</a>
      </small></p>
    </footer>
  </body>
</html>
