    <script>
      $("button.announcer").click(function()
      {
        var secret = $(this).data("secret");
        $.post("{{url}}", {"secret": secret});

        var content = $(this).html();
        var restore = $.proxy(function(content)
        {
          $(this).html(content)
                 .toggleClass("hollow")
                 .prop("disabled", false);
        }, this);

        $(this).prop("disabled", true)
               .toggleClass("hollow")
               .html('<i class="fa fa-lg fa-spinner fa-spin"></i>');

        setTimeout(restore, 3000, content);
      });
    </script>
