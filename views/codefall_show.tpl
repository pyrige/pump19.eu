% rebase("base.tpl", active="codefall")
% if defined("entry"):
<div class="row">
  <div class="small-12 columns">
    <h1><i class="fa fa-gift"></i>&nbsp;Claim Code</h1>
  </div>
</div>
<div class="row">
  <div class="small-11 small-centered columns">
    <p>You're just one step away from claiming the following code:</p>
    <form id="captcha-form" action="{{entry["claim_url"]}}" method="POST" accept-charset="utf-8">
      <div class="callout panel text-center">
        <h1>
          <i class="fa fa-gamepad"></i>&nbsp;{{entry["description"]}}
          <small>{{entry["code_type"]}}</small>
        </h1>

        <div id="captcha" style="display: inline-block;"></div>
      </div>
    </form>
  </div>
</div>
% else:
<div class="row">
  <div class="small-12 columns">
    <h1><i class="fa fa-frown-o"></i>&nbsp;Already Claimed</h1>
  </div>
</div>
<div class="row">
  <div class="small-11 small-centered columns">
    <p>
      Sorry, the code you were trying to view is already claimed by someone else.
      Better luck next time!
    </p>
  </div>
</div>
% end
