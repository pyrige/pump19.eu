% rebase("base.tpl", active="commands")
<div class="row">
  <div class="small-12 columns">
    <h1><i class="fa fa-keyboard-o"></i>&nbsp;Commands</h1>
  </div>
</div>
% for command in commands:
<div class="row">
  <div class="small-11 small-centered columns">
    <div class="row">
      <div class="small-12 columns">
      % if isinstance(command["trigger"], str):
        <kbd>{{command["trigger"]}}</kbd>
      % else:
        % for trigger in command["trigger"]:
        <kbd>{{trigger}}</kbd>
        % end
      % end
      % if "modonly" in command:
        <div class="right radius warning label">Moderator</div>
      % else:
        <div class="right radius success label">Everyone</div>
      % end
      </div>
    </div>
    <div class="row">
      <div class="small-12 columns">
        {{command["desc"]}}
      % if "url" in command:
        <a href="{{command["url"]}}" class="right">
          <i class="fa fa-external-link"></i>&nbsp;Link
        </a>
      % end
      </div>
    </div>
  % if "example" in command:
    <div class="row hide-for-small-only">
      <div class="small-12 columns">
        <div class="radius callout panel clearfix">
        % if isinstance(command["example"], str):
          <span class="right radius label">Example</span>
          <div>
            <span class="round info label"><i class="fa fa-terminal"></i></span>
            <kbd>{{command["example"]}}</kbd>
          </div>
        % else:
          <span class="right radius label">Examples</span>
          % for example in command["example"]:
          <div>
            <span class="round info label"><i class="fa fa-terminal"></i></span>
            <kbd>{{example}}</kbd>
          </div>
          % end
        % end
        </div>
      </div>
    </div>
  % end
    <div class="row"><div class="small-12 columns"><hr></div></div>
  </div>
</div>
% end
