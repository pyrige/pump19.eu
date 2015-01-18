<%inherit file="base.mako"/>

<h2 class="row-fluid">List of commands:</h2>
<dl class="row-fluid">
  % for command in commands:
  ${add_command(command)}\
  % endfor
</dl>

<%def name="add_command(command)">
<div class="panel panel-success">
  <dt class="panel-heading"> \
    ${add_trigger(command.get("trigger"))}
% if command.get("modonly"):
    <span class="label label-danger pull-right">Moderator</span>
% else:
    <span class="label label-default pull-right">Everyone</span>
% endif
  </dt>
  <dd class="panel-body">
    ${command.get("desc")}
% if command.get("url"):
    <a href="${command.get("url")}" class="btn btn-info btn-sm pull-right">
      <span class="glyphicon glyphicon-link" aria-hidden="true"></span> Link
    </a>
% endif
% if command.get("example"):
    ${add_example(command.get("example"))}
% endif
  </dd>
</div>
</%def>

<%def name="add_trigger(trigger)">
<% trigger = [trigger] if isinstance(trigger, str) else trigger %>
% for entry in trigger:
    <kbd>${entry | h}</kbd>
% endfor
</%def>

<%def name="add_example(example)">
<% example = [example] if isinstance(example, str) else example %>
% for entry in example:
<div class="row-fluid">
  <span class="label label-success">Example:</span>
  <kbd class="example">${entry | h}</kbd>
</div>
% endfor
</%def>
