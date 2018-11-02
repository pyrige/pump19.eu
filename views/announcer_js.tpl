    <script>
      $("button.announcer").click(function()
      {
        var secret = $(this).data("secret");
        $.post("{{url}}", {"secret": secret});

        var restore = $.proxy(function()
        {
          $(this).toggleClass("is-loading")
                 .prop("disabled", false);
        }, this);

        $(this).prop("disabled", true)
               .toggleClass("is-loading");

        setTimeout(restore, 3000);
      });
    </script>
