<!DOCTYPE html>
<html class="no-js" lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Pump19 &#124; {{ subtitle }}</title>
    <link rel="icon" type="image/gif" href="data:image/gif;base64,R0lGODlhEAAQAOMJAAABACcgFkE2IllMMnJiQop3Uf92AP+pAP/MBv///////////////////////////yH5BAEKAA8ALAAAAAAQABAAAARf8MkHqrVzAjGIJ0UIZNvQfZ4olSeajhQ3CEFN0HVRyYNxGAGCD6gDBAScA+IQGCiZRRpnaBoKokeTidfRxTgfpODj3cgIrZP3a6q5QeuYKVWgw9jdkIqEVO8zFBcYEhEAOw==">

    <link rel="stylesheet" href="/static/css/app.css.gz">
  </head>
  <body>
    <header>
      <nav class="navbar" role="navigation" aria-label="main navigation">
        <div class="container">
          <div class="navbar-brand">
            <a href="/" title="Pump19"
               class="navbar-item{{!" is-active" if get("active") == "home" else ""}}">
              <span class="icon is-medium"><i class="mdi mdi-24px mdi-twitch"></i></span>
              <span>Pump19</span>
            </a>
            <a role="button" class="navbar-burger burger"
              aria-label="menu" aria-expanded="false"
              data-target="mainMenu">
              <span aria-hidden="true"></span>
              <span aria-hidden="true"></span>
              <span aria-hidden="true"></span>
            </a>
          </div>

          <div id="mainMainu" class="navbar-menu">
            <div class="navbar-start">
              <a href="/commands" title="Commands"
                 class="navbar-item{{!" is-active" if get("active") == "commands" else ""}}">
                <span class="icon is-medium"><i class="mdi mdi-24px mdi-console"></i></span>
                <span>Commands</span>
              </a>
              <a href="/codefall" title="Codefall"
                 class="navbar-item{{!" is-active" if get("active") == "codefall" else ""}}">
                <span class="icon is-medium"><i class="mdi mdi-24px mdi-gift"></i></span>
                <span>Codefall</span>
              </a>
              <a href="/bingo" title="Trope Bingo"
                 class="navbar-item{{!" is-active" if get("active") == "bingo" else ""}}">
                <span class="icon is-medium"><i class="mdi mdi-24px mdi-puzzle"></i></span>
                <span>Trope&nbsp;Bingo</span>
              </a>
              <a href="/contribute" title="Contribute"
                 class="navbar-item{{!" is-active" if get("active") == "contribute" else ""}}">
                <span class="icon is-medium"><i class="mdi mdi-24px mdi-medical-bag"></i></span>
                <span>Contribute</span>
              </a>
            </div>

            <div class="navbar-end">
              <div class="navbar-item">
              % if session.get("logged_in", False):
                <a href="/logout" title="Log out" class="button is-dark">
                  <span class="icon"><i class="mdi mdi-logout"></i></span>
                  <span>Log&nbsp;out</span>
                </a>
              % else:
                <a href="/login" title="Log in" class="button is-primary">
                  <span class="icon"><i class="mdi mdi-login"></i></span>
                  <span>Log&nbsp;in</span>
                </a>
              % end
              </div>
            </div>
          </div>
        </div>
      </nav>
    </header>

    {{!base}}

    <div class="expander"></div>

    <footer class="footer">
      <div class="content container has-text-centered">
        <small>
          Powered by
          <a href="https://bulma.io/">Bulma</a>
          and
          <a href="https://materialdesignicons.com/">
            Material Design Icons
          </a>
          <br>
          <i class="mdi mdi-copyright"></i>
          2015-2018 Twisted Pear
        </small>
      </div>
    </footer>

    <!-- JS components -->
    <script src="/static/js/app.js.gz"></script>
    <%
      rc_sitekey = get("rc_sitekey")
      if rc_sitekey:
        include("captcha_js.tpl", sitekey=rc_sitekey)
      end

      announce_url = get("announce_url")
      if announce_url:
        include("announcer_js.tpl", url=announce_url)
      end
    %>
  </body>
</html>
