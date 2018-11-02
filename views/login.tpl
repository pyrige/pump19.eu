% rebase("base.tpl", active="login")
<section class="section">
  <div class="content container">
  % if session.get("logged_in", False):
    <h1>
      <span class="icon"><i class="mdi mdi-twitch"></i></span>
      Connected with Twitch.tv
    </h1>
    <p>
      You are now logged in as <strong>{{session.get("user_name")}}</strong>.
      In the unlikely case that this isn't you, please
      <a href="/logout"><span class="icon"><i class="mdi mdi-logout"></i></span>log out</a> now.
    </p>
    <p>
      While we keep track of your user name, we <strong>do not</strong> have access to your password.
      We use cookies to maintain your session and the connection to your Twitch account. Those
      sessions will be cleared on a regular basis.
      If you do not wish to grant us access to that kind of information, you may
      <a href="/logout"><span class="icon"><i class="mdi mdi-logout"></i></span>log out</a> now.
    </p>
  % else:
    <h1>
      <span class="icon"><i class="mdi mdi-login"></i></span>
      Connect with Twitch.tv
    </h1>
    <p>
      Granting us <strong>minimal</strong> access to your <a href="https://twitch.tv">Twitch.tv</a>
      account will allow us to see your Twitch user name and lets us provide additional functionality
      that requires authentication.
    </p>
    <p>
      While we keep track of your user name, we <strong>do not</strong> have access to your password.
      We use cookies to maintain your session and the connection to your Twitch account. Those
      sessions will be cleared on a regular basis.
      If you do not wish to grant us access to that kind of information, you may ignore this page
      entirely.
    </p>
    <form action="{{twitch_oauth_url}}" method="GET">
      <input type="hidden" name="response_type" value="code">
      <input type="hidden" name="client_id" value="{{twitch_client_id}}">
      <input type="hidden" name="redirect_uri" value="{{oauth_response_url}}">
      <input type="hidden" name="state" value="{{session.id}}">
      <input type="image" alt="Connect with Twitch.tv" src="/static/img/twitch_connect.png">
    </form>
  % end
  </div>
</section>
