% rebase("base.tpl", active="codefall")
<div class="jumbotron">
% if defined("entry"):
  <h1><i class="fa fa-gift"></i>&nbsp;Claimed Code</h1>
  <p>Congratulations, you just claimed the following entry:</p>
  <h2><i class="fa fa-info"></i>&nbsp;Description</h2>
  <p class="text-info">
    <span class="label label-info pull-right"><i class="fa fa-gamepad"></i>&nbsp;{{entry["code_type"]}}</span>
    {{entry["description"]}}
  </p>
  <h2><i class="fa fa-link"></i>&nbsp;Link or Key</h2>
  <p><code>{{entry["code"]}}</code></p>
% else:
  <h1><i class="fa fa-frown-o"></i>&nbsp;Already Claimed</h1>
  <p>
    Sorry, the code you were trying to get is already claimed by someone else.
    Better luck next time!
  </p>
% end
</div>
