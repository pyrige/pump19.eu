SUFFIX = .css
SOURCE_DIR = source

INPUT_FILES = $(SOURCE_DIR)/normalize$(SUFFIX) \
              $(SOURCE_DIR)/font-awesome$(SUFFIX) \
              $(SOURCE_DIR)/foundation$(SUFFIX) \
              $(SOURCE_DIR)/app$(SUFFIX)

OUTPUT_FILE = min$(SUFFIX)

BINGO_INPUT_FILE = $(SOURCE_DIR)/bingo$(SUFFIX)
BINGO_OUTPUT_FILE = bingo.min$(SUFFIX)

mini:
	cat $(INPUT_FILES) >$(OUTPUT_FILE)
	css-html-js-minify.py --quiet --overwrite $(OUTPUT_FILE)

bingo:
	cat $(BINGO_INPUT_FILE) >$(BINGO_OUTPUT_FILE)
	css-html-js-minify.py --quiet --overwrite $(BINGO_OUTPUT_FILE)

clean:
	rm -f $(OUTPUT_FILE)
