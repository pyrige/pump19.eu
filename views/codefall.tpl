% rebase("base.tpl", active="codefall")
<h1><i class="fa fa-gift"></i>&nbsp;Codefall</h1>
<p>On this page you can <strong>add new keys and links</strong> for codefall and view your claimed and unclaimed codefall entries.</p>
% if session.get("logged_in", False):
<h3>Unclaimed Entries</h3>
  % if not len(unclaimed):
<p class="text-info">You don't have any unclaimed entries.</p>
  % else:
    % for entry in unclaimed:
<div class="panel panel-primary">
  <div class="panel-heading">
    <i class="fa fa-gift"></i>
    {{entry["description"]}}
    <span class="label label-info">{{entry["code_type"]}}</span>
  </div>
  <div class="panel-body">
    <i class="fa fa-link"></i>
    Claim Link:
    <code>{{entry["secret_url"]}}</code>
    (or copy <a href="{{entry["secret_url"]}}">this link</a>)
  </div>
</div>
    % end
  % end

<h3>Add a New Entry</h3>
<form action="/codefall/add" method="POST" accept-charset="utf-8" class="well">
  <div class="form-group">
    <label for="codefallDescription">
      <i class="fa fa-info"></i>
      Description
      <span class="label label-default">mandatory</span>
    </label>
    <input type="text" class="form-control" name="description" id="codefallDescription" placeholder="Game of the Year">
  </div>
  <div class="form-group">
    <label for="codefallKeyLink">
      <i class="fa fa-link"></i>
      Link or Key
      <span class="label label-default">mandatory</span>
    </label>
    <input type="text" class="form-control" name="code" id="codefallKeyLink" placeholder="S3CR3T-D0WNL04D-K3Y">
  </div>
  <div class="form-group">
    <label for"codefallType">
      <i class="fa fa-gamepad"></i>
      Type
      <span class="label label-default">mandatory</span>
    </label>
    <select class="form-control" name="code_type" id="codefallType">
      <option>Steam</option>
      <option>Humble Bundle</option>
      <option>GOG</option>
      <option>Desura</option>
      <option>Other</option>
    </select>
  </div>
  <button type="reset" class="btn btn-default">
    <i class="fa fa-times"></i>
    Reset
  </button>
  <button type="submit" class="btn btn-success">
    <i class="fa fa-check"></i>
    Submit
  </button>
</form>
<h3>Claimed Entries</h3>
  % if not len(claimed):
<p class="text-info">You don't have any claimed entries.</p>
  % else:
<ul>
    % for entry in claimed:
  <li>
    {{entry["description"]}}
    <span class="label label-default">{{entry["code_type"]}}</span>
  </li>
    % end
</ul>
  % end
% else:
<p class="text-info">
  You need to <a href="/login"><i class="fa fa-sign-in"></i>&nbsp;log in</a> if you want to use
  this page.
</p>
% end
