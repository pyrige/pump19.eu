% rebase("base.tpl", active="commands")
<h1><i class="fa fa-keyboard-o"></i>&nbsp;Commands</h1>
<dl>
% for command in commands:
    <div class="panel panel-primary">
      <dt class="panel-heading">
      % if isinstance(command["trigger"], str):
        <kbd>{{command["trigger"]}}</kbd>
      % else:
        % for trigger in command["trigger"]:
        <kbd>{{trigger}}</kbd>
        % end
      % end
      % if "modonly" in command:
        <div class="label label-danger pull-right">Moderator</div>
      % else:
        <div class="label label-success pull-right">Everyone</div>
      % end
      </dt>
      <dd class="panel-body">
        {{command["desc"]}}
      % if "url" in command:
        <a href="{{command["url"]}}" class="btn btn-default btn-xs pull-right">
          <i class="fa fa-external-link"></i>&nbsp;Link
        </a>
      % end
      % if "example" in command:
        <div class="well well-sm list-unstyled">
        % if isinstance(command["example"], str):
          <span class="label label-warning pull-right">Example</span>
          <div>
            <span class="badge"><i class="fa fa-terminal"></i></span>
            <kbd>{{command["example"]}}</kbd>
          </div>
        % else:
          <span class="label label-warning pull-right">Examples</span>
          % for example in command["example"]:
          <div>
            <span class="badge"><i class="fa fa-terminal"></i></span>
            <kbd>{{example}}</kbd></div>
          % end
        % end
        </div>
      % end
      </dd>
    </div>
% end
</dl>
