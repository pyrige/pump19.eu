% rebase("base.tpl", active="codefall")
<article class="grid-x grid-margin-x align-center">
  <section class="small-11 cell">
    <h1>
      <i class="fa fa-gift"></i>
      Codefall
    </h1>
    <p>
      On this page you can <strong>add new keys and links</strong> for codefall and view your claimed and unclaimed codefall entries.
    </p>
% if session.get("logged_in", False):
  </section>
  <section class="small-11 cell">
    <h3>
      Unclaimed Entries
    </h3>
  % if not len(unclaimed):
    <p>
      You don't have any unclaimed entries.
    </p>
  % else:
    % for entry in unclaimed:
    <div class="callout grid-x">
      <div class="cell auto">
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
    </div>
    % end
  % end
  </section>
  <section class="small-11 cell">
    <h3>Add a New Entry</h3>
    <form action="/codefall/add" method="POST" accept-charset="utf-8" data-abide>
      <fieldset class="fieldset">
        <legend>New Codefall Entry</legend>

        <div class="desc-field">
          <label>
            <i class="fa fa-info"></i>&nbsp;Description
            <small>required</small>
            <input required type="text" name="description" id="codefallDescription" placeholder="Game of the Year">
            <span class="form-error">
              Please supply a short description (e.g. the game's title).
            </span>
          </label>
        </div>

        <div class="code-field">
          <label>
            <i class="fa fa-link"></i>&nbsp;Link or Key
            <small>required</small>
            <input required type="text" name="code" id="codefallKeyLink" placeholder="S3CR3T-D0WNL04D-K3Y">
            <span class="form-error">
              Please specify the actual link or key people can use to redeem this game.
            </span>
          </label>
        </div>

        <div class="type-field">
          <label>
            <i class="fa fa-gamepad"></i>&nbsp;Type
            <small>required</small>
            <select required name="code_type" id="codefallType">
              <option>Steam</option>
              <option>Humble Bundle</option>
              <option>GOG</option>
              <option>Origin</option>
              <option>Desura</option>
              <option>Other</option>
            </select>
            <span class="form-error">
              Please specify what kind of codefall entry this is.
            </span>
          </label>
        </div>
      </fieldset>

      <div class="grid-x grid-margin-x">
        <div class="small-4 cell">
          <button type="reset" class="secondary expanded button">
            <i class="fa fa-times"></i>
            Reset
          </button>
        </div>
        <div class="small-8 cell">
          <button type="submit" class="success expanded button">
            <i class="fa fa-check"></i>
            Submit
          </button>
        </div>
      </div>
    </form>
  </section>
  <section class="small-11 cell">
    <h3>Claimed Entries</h3>
  % if not len(claimed):
    <p class="text-info">You don't have any claimed entries.</p>
  % else:
    <ul class="callout no-bullet" style="max-height: 25vh; overflow: auto;">
      % for entry in claimed:
      <li>
        {{entry["description"]}}
        <span class="secondary label">{{entry["code_type"]}}</span>
      </li>
      % end
    </ul>
  % end
  </section>
% else:
    <p>
      You need to <a href="/login"><i class="fa fa-sign-in"></i>&nbsp;log in</a> if you want to use
      this page.
    </p>
% end
  </section>
</article>
