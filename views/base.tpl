<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Pump19 &#124; {{ subtitle }}</title>
    <link rel="stylesheet" href="/static/css/bootstrap.min.css">
    <link rel="stylesheet" href="/static/css/font-awesome.min.css">
  </head>
  <body>
    <header>
      <nav class="navbar navbar-default navbar-static-top">
        <div class="container">
          <div class="navbar-header">
            <span class="navbar-brand">Pump19</span>
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
    </header>

    <div class="container">
      {{!base}}
    </div>
  </body>
</html>
