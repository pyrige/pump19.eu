% rebase("base.tpl", subtitle=subtitle)
<h1>List of commands</h1>
<dl>
% for command in commands:
    <div class="uk-panel uk-panel-box uk-panel-box-primary uk-margin">
      <dt>
        <span class="uk-icon-terminal uk-icon-button"></span>
      % if isinstance(command["trigger"], str):
        <kbd class="uk-text-large">{{command["trigger"]}}</kbd>
      % else:
        % for trigger in command["trigger"]:
        <kbd class="uk-text-large">{{trigger}}</kbd>
        % end
      % end
      % if "modonly" in command:
        <div class="uk-badge uk-badge-danger uk-panel-badge">Moderator</div>
      % else:
        <div class="uk-badge uk-badge-success uk-panel-badge">Everyone</div>
      % end
      </dt>
      <dd>
        {{command["desc"]}}
      % if "url" in command:
        <a href="{{command["url"]}}" class="uk-button uk-button-mini uk-button-primary">
          <span class="uk-icon-link"></span> Link
        </a>
      % end
      % if "example" in command:
        <div class="uk-panel uk-panel-box uk-panel-box-secondary uk-margin-top">
        % if isinstance(command["example"], str):
          <div class="uk-display-block">
            <span class="uk-badge uk-badge-warning">Example</span>
            <kbd>{{command["example"]}}</kbd>
          </div>
        % else:
          % for example in command["example"]:
          <div class="uk-display-block">
            <span class="uk-badge uk-badge-warning">Example</span>
            <kbd>{{example}}</kbd>
          </div>
          % end
        % end
        </div>
      % end
      </dd>
    </div>
% end
</dl>
