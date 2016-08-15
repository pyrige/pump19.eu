<script type="text/javascript">
  var captchaLoaded = function() {
    var verified = function(response) {
      $("#captcha-form").submit();
    };

    var options = {
      "sitekey": "{{ sitekey }}",
      "callback": verified,
      "theme": "light"
    };

    grecaptcha.render("captcha", options);
  };
</script>
<script src="https://www.google.com/recaptcha/api.js?onload=captchaLoaded&render=explicit" async defer></script>
