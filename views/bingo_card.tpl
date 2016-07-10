<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Pump19 &#124; Trope Bingo Card</title>
    <link rel="icon" type="image/gif" href="data:image/gif;base64,R0lGODlhEAAQAOMJAAABACcgFkE2IllMMnJiQop3Uf92AP+pAP/MBv///////////////////////////yH5BAEKAA8ALAAAAAAQABAAAARf8MkHqrVzAjGIJ0UIZNvQfZ4olSeajhQ3CEFN0HVRyYNxGAGCD6gDBAScA+IQGCiZRRpnaBoKokeTidfRxTgfpODj3cgIrZP3a6q5QeuYKVWgw9jdkIqEVO8zFBcYEhEAOw==">
    <link rel="stylesheet" href="/static/css/bingo.min.css">
  </head>
  <body id="viewport">
    <div id="bingo-card">
      <div id="bingo-header">
      % for letter in "TROPE":
        <span class="bingo-letter">{{letter}}</span>
      % end
      </div>
      <div id="bingo-game">
      % from itertools import islice
      % for row in range(5):
        <div class="bingo-row">
        % start, stop = 5 * row, 5 + 5 * row
        % for trope in islice(tropes, start, stop):
          <div class="bingo-square">
            <span class="trope">{{trope}}</span>
          </div>
        % end
        </div>
      % end
      </div>
    </div>

    <script
      src="https://code.jquery.com/jquery-3.1.0.slim.min.js"
      integrity="sha256-cRpWjoSOw5KcyIOaZNo4i6fZ9tKPhYYb6i5T9RSVJG8="
      crossorigin="anonymous"></script>
    <script type="text/javascript">
      $(".bingo-square").click(function() {
        $(this).toggleClass("stamped");
      });
    </script>
  </body>
</html>
