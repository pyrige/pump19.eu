% rebase("base.tpl", active="codefall")
<section class="section">
  <div class="content container">
    <h1>
      <span class="icon"><i class="mdi mdi-gift"></i></span>
      Codefall
    </h1>
    <p>
      On this page you can <strong>add new keys and links</strong> for codefall and view your claimed and unclaimed codefall entries.
    </p>
% if session.get("logged_in", False):
    <h3>
      Unclaimed Entries
    </h3>
  % if not len(unclaimed):
    <p>
      You don't have any unclaimed entries.
    </p>
  % else:
    % for entry in unclaimed:
    %   secret_url = show_url.format(secret=entry["secret"])
    <div class="message">
      <div class="message-header">
        <span class="icon"><i class="mdi mdi-gift"></i></span>
        <strong>{{ entry["description"] }}</strong>
        <small>{{ entry["code_type"] }}</small>
      </div>
      <div class="message-body">
        <div class="columns">
          <div class="column">
            <p>
              <span class="icon"><i class="mdi mdi-link-variant"></i></span>
              Claim Link
              <code>{{ secret_url }}</code>
              (or copy <a href="{{ secret_url }}">this link</a>)
            </p>
            <p>
              <span class="icon"><i class="mdi mdi-twitch"></i></span>
              Chat Template
              <code>Codefall | {{ entry["description"] }} ({{ entry["code_type"] }}) {{ secret_url }}</code>
            </p>
          </div>
          <div class="column is-narrow">
            <button title="Announce"
                    class="announcer button is-medium is-primary"
                    data-secret="{{ entry["secret"] }}">
              <span class="icon"><i class="mdi mdi-bullhorn"></i></span>
            </button>
          </div>
        </div>
      </div>
    </div>
    % end
  % end
    <h3>Add a New Entry</h3>
    <form action="/codefall/add" method="POST" accept-charset="utf-8">
      <div class="message">
        <div class="message-header">
          <p>New Codefall Entry</p>
        </div>
        <div class="message-body">

          <div class="field is-horizontal">
            <div class="field-label is-normal">
              <label class="label">
                <span class="icon"><i class="mdi mdi-information"></i></span>
                Description
              </label>
            </div>
            <div class="field-body">
              <div class="field">
                <div class="control has-icons-left">
                  <input required class="input" type="text" name="description" placeholder="Game of the Year">
                  <span class="icon is-left"><i class="mdi mdi-information"></i></span>
                </div>
              </div>
            </div>
          </div>

          <div class="field is-horizontal">
            <div class="field-label is-normal">
              <label class="label">
                <span class="icon"><i class="mdi mdi-key"></i></span>
                Link or Key
              </label>
            </div>
            <div class="field-body">
              <div class="field">
                <div class="control has-icons-left">
                  <input required class="input" type="text" name="code" placeholder="S3CR3T-D0WNL04D-K3Y">
                  <span class="icon is-left"><i class="mdi mdi-key"></i></span>
                </div>
              </div>
            </div>
          </div>
          <div class="field is-horizontal">
            <div class="field-label is-normal">
              <label class="label">
                <span class="icon"><i class="mdi mdi-gamepad"></i></span>
                Code Type
              </label>
            </div>
            <div class="field-body">
              <div class="field">
                <div class="control has-icons-left is-expanded">
                  <span class="select is-fullwidth">
                    <select required name="code_type" id="codefallType">
                      <option>Steam</option>
                      <option>Humble Bundle</option>
                      <option>GOG</option>
                      <option>Epic Games</option>
                      <option>Origin</option>
                      <option>Other</option>
                    </select>
                  </span>
                  <span class="icon is-left"><i class="mdi mdi-gamepad"></i></span>
                </div>
              </div>
            </div>
          </div>
          <div class="field is-grouped is-grouped-right">
            <p class="control">
              <button type="reset" class="button is-warning">
                <span class="icon"><i class="mdi mdi-cancel"></i></span>
                <span>Reset</span>
              </button>
            </p>
            <p class="control">
              <button type="submit" class="button is-success">
                <span class="icon"><i class="mdi mdi-check"></i></span>
                <span>Submit</span>
              </button>
            </p>
          </div>
        </div>
      </div>
    </form>
    <h3>Claimed Entries</h3>
  % if not len(claimed):
    <p class="text-info">You don't have any claimed entries.</p>
  % else:
    <div class="message is-small">
      <div id="claimedCodes" class="message-body is-small">
        <ul class="is-marginless">
          % for entry in claimed:
          <li>
            {{entry["description"]}}
            <span class="tag">{{entry["code_type"]}}</span>
          </li>
          % end
        </ul>
      </div>
    </div>
  % end
% else:
    <p>
      You need to <a href="/login"><span class="icon"><i class="mdi mdi-login"></i></span>log in</a> if you want to use
      this page.
    </p>
% end
  </div>
</section>
