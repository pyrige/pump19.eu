INPUT = vendor/jquery.js \
        foundation/foundation.js \
        foundation/foundation.abide.js \
        foundation/foundation.topbar.js \
        app.js

OUTPUT = min.js

mini:
	uglifyjs $(INPUT) -o $(OUTPUT) -c

clean:
	rm min.js
