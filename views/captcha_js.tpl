    <script type="text/javascript">
      var captchaLoaded = function() {
        var verified = function(response) {
          $("#captcha-form").submit();
        };

        var options = {
          "sitekey": "{{ sitekey }}",
          "callback": verified,
          "theme": "dark"
        };

        grecaptcha.render("captcha", options);
      };

      $(function() {
        var ch = document.getElementById("code-hero");
        ch.scrollIntoView({block: "start", behavior: "instant"});
      });
    </script>
    <script src="https://www.google.com/recaptcha/api.js?onload=captchaLoaded&render=explicit" async defer></script>
