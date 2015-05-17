% rebase("base.tpl", active="scrobblrr")
% import uuid
<div class="row">
  <div class="small-12 columns">
    <h1><i class="fa fa-music"></i>&nbsp;ScrobbLRR</h1>
  </div>
</div>
<div class="row">
  <div class="small-11 small-centered columns">
    <p>
      <strong>ScrobbLRR</strong> is a service provided by Pump19 that lets you share your currently
      playing media with the <a href="http://twitch.tv/loadingreadyrun/">LoadingReadyRun Twitch Chat</a>.
      It uses a mechanism you are probably familiar with from services like <a href="http://www.last.fm/">last.fm</a>.
      In fact, it uses the same protocol and thus should be compatible with most plugins that let
      you specify user-defined scrobble URLs.
    <p>
      On this page you can <strong>look up your credentials</strong> for ScrobbLRR and check how to
      set up your favourite audio player to scrobble to it.
    </p>
  </div>
</div>
% if session.get("logged_in", False):
<div class="row">
  <div class="small-11 small-centered columns">
    <h2>Credentials</h2>
    <p>
      These are the credentials you need to use when setting up your audioscrobbler.
    </p>
    <div class="row">
      <div class="small-11 small-centered columns">
        <table>
          <tr>
            <td><strong>User Name</strong></td>
            <td><kbd>{{session.get("user_name")}}</kbd></td>
          </tr>
          <tr>
            <td><strong>Password</strong></td>
            <td>
              <kbd>{{cred}}</kbd>
            </td>
          </tr>
          <tr>
            <td><strong>Scrobble URL</strong></td>
            <td><kbd>{{scrobble_url}}</kbd></td>
          </tr>
        </table>
      </div>
    </div>
  </div>
</div>
% else:
<div class="row">
  <div class="small-11 small-centered columns">
    <p>
      You need to <a href="/login"><i class="fa fa-sign-in"></i>&nbsp;log in</a> if you want to use
      this page.
    </p>
  </div>
</div>
% end
