% rebase("base.tpl", active="codefall")
<div class="row">
  <div class="small-12 columns">
    <h1><i class="fa fa-gift"></i>&nbsp;Codefall</h1>
  </div>
</div>
<div class="row">
  <div class="small-11 small-centered columns">
    <p>On this page you can <strong>add new keys and links</strong> for codefall and view your claimed and unclaimed codefall entries.</p>
% if session.get("logged_in", False):
    <h3>Unclaimed Entries</h3>
  % if not len(unclaimed):
    <p>You don't have any unclaimed entries.</p>
  % else:
    % for entry in unclaimed:
    <div class="radius callout panel">
      <h4>
        <i class="fa fa-gift"></i>
        <strong>{{entry["description"]}}</strong>
        <small>{{entry["code_type"]}}</small>
      </h4>
      <p>
        <i class="fa fa-link"></i>
        Claim Link:
        <code>{{entry["secret_url"]}}</code>
        (or copy <a href="{{entry["secret_url"]}}">this link</a>)
      </p>
    </div>
    % end
  % end

    <h3>Add a New Entry</h3>
    <form action="/codefall/add" method="POST" accept-charset="utf-8" data-abide>
      <fieldset>
        <legend>New Codefall Entry</legend>

        <div class="desc-field">
          <label>
            <i class="fa fa-info"></i>&nbsp;Description
            <small>required</small>
            <input required type="text" name="description" id="codefallDescription" placeholder="Game of the Year">
          </label>
          <small class="error">Please supply a short description (e.g. the game's title).</small>
        </div>

        <div class="code-field">
          <label>
            <i class="fa fa-link"></i>&nbsp;Link or Key
            <small>required</small>
            <input required type="text" name="code" id="codefallKeyLink" placeholder="S3CR3T-D0WNL04D-K3Y">
          </label>
          <small class="error">Please specify the actual link or key people can use to redeem this game.</small>
        </div>

        <div class="type-field">
          <label>
            <i class="fa fa-gamepad"></i>&nbsp;Type
            <small>required</small>
            <select required name="code_type" id="codefallType">
              <option>Steam</option>
              <option>Humble Bundle</option>
              <option>GOG</option>
              <option>Desura</option>
              <option>Other</option>
            </select>
          </label>
          <small class="error">Please specify what kind of codefall entry this is.</small>
        </div>
      </fieldset>

      <div class="row">
        <div class="small-4 columns">
          <button type="reset" class="radius secondary expand button">
            <i class="fa fa-times"></i>
            Reset
          </button>
        </div>
        <div class="small-8 columns">
          <button type="submit" class="radius success expand button">
            <i class="fa fa-check"></i>
            Submit
          </button>
        </div>
      </div>
    </form>

    <h3>Claimed Entries</h3>
  % if not len(claimed):
    <p class="text-info">You don't have any claimed entries.</p>
  % else:
    <ul class="square">
      % for entry in claimed:
      <li>
        {{entry["description"]}}
        <span class="radius info label">{{entry["code_type"]}}</span>
      </li>
      % end
    </ul>
  % end
% else:
    <p>
      You need to <a href="/login"><i class="fa fa-sign-in"></i>&nbsp;log in</a> if you want to use
      this page.
    </p>
% end
  </div>
</div>
