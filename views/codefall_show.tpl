% rebase("base.tpl", active="codefall")
<div class="jumbotron">
% if defined("entry"):
  <h1><i class="fa fa-gift"></i>&nbsp;Claim Code</h1>
  <p>You're just one step away from claiming the following code:</p>
  <h2><i class="fa fa-info"></i>&nbsp;Description</h2>
  <p class="text-info">
    <span class="label label-info pull-right"><i class="fa fa-gamepad"></i>&nbsp;{{entry["code_type"]}}</span>
    {{entry["description"]}}
  </p>
  <p class="text-center">
    <a href="{{entry["claim_url"]}}" class="btn btn-danger btn-lg" role="button">
      <i class="fa fa-bullseye"></i>
      Claim Code Now
    </a>
  </p>
% else:
  <h1><i class="fa fa-frown-o"></i>&nbsp;Already Claimed</h1>
  <p>
    Sorry, the code you were trying to view is already claimed by someone else.
    Better luck next time!
  </p>
% end
</div>
