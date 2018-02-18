<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Pump19 &#124; Trope Bingo Card</title>
    <link rel="icon" type="image/gif" href="data:image/gif;base64,R0lGODlhEAAQAOMJAAABACcgFkE2IllMMnJiQop3Uf92AP+pAP/MBv///////////////////////////yH5BAEKAA8ALAAAAAAQABAAAARf8MkHqrVzAjGIJ0UIZNvQfZ4olSeajhQ3CEFN0HVRyYNxGAGCD6gDBAScA+IQGCiZRRpnaBoKokeTidfRxTgfpODj3cgIrZP3a6q5QeuYKVWgw9jdkIqEVO8zFBcYEhEAOw==">
    <link rel="stylesheet" href="/static/css/bingo.css">
  </head>
  <body id="viewport">
    <div id="bingo-card">
    % for letter in "TROPE":
      <div class="letter">{{letter}}</div>
    % end
      <div class="free stamped">Loading Ready Trope Bingo</div>
      % for trope in tropes:
      <div class="square">
        <span class="trope">{{trope}}</span>
      </div>
      % end
    </div>

    <script type="text/javascript">
      document.querySelectorAll("#bingo-card .square").forEach((el) => {
        el.addEventListener("click", () => {
          el.classList.toggle("stamped");
        });
      });
    </script>
  </body>
</html>
