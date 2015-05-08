% rebase("base.tpl", active="login")
% if session.get("logged_in", False):
<div class="row">
  <div class="small-12 columns">
    <h1><i class="fa fa-twitch"></i>&nbsp;Connected with Twitch.tv</h1>
  </div>
</div>
<div class="row">
  <div class="small-11 small-centered columns">
    <p>
      You are now logged in as <strong>{{session.get("user_name")}}</strong>.
      In the unlikely case that this isn't you, please
      <a href="/logout"><i class="fa fa-sign-out"></i>&nbsp;log out</a> now.
    </p>
    <p>
      While we keep track of your user name, we <strong>do not</strong> have access to your password.
      We use cookies to maintain your session and the connection to your Twitch account. Those
      sessions will be cleared on a regular basis.
      If you do not wish to grant us access to that kind of information, you may
      <a href="/logout"><i class="fa fa-sign-out"></i>&nbsp;log out</a> now.
    </p>
  </div>
</div>
% else:
<div class="row">
  <div class="small-12 columns">
    <h1><i class="fa fa-sign-in"></i>&nbsp;Connect with Twitch.tv</h1>
  </div>
</div>
<div class="row">
  <div class="small-11 small-centered columns">
    <p>
      Granting us <strong>minimal</strong> access to your <a href="https://twitch.tv">Twitch.tv</a>
      account will allow us to see your Twitch user name and lets us provide additional functionality
      that requires authentication (such as rating <a href="/quotes/">quotes</a> or maintaining your
      <a href="#">codefall</a> entries).
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
  </div>
</div>
% end
