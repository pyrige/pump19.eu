SUFFIX = .js
SOURCE_DIR = source

INPUT_FILES = $(SOURCE_DIR)/vendor/modernizr$(SUFFIX) \
              $(SOURCE_DIR)/vendor/jquery$(SUFFIX) \
              $(SOURCE_DIR)/foundation/foundation$(SUFFIX) \
              $(SOURCE_DIR)/foundation/foundation.abide$(SUFFIX) \
              $(SOURCE_DIR)/foundation/foundation.topbar$(SUFFIX) \
              $(SOURCE_DIR)/app$(SUFFIX)

OUTPUT_FILE = min$(SUFFIX)

mini:
	uglifyjs $(INPUT_FILES) -o $(OUTPUT_FILE) -c

clean:
	rm -f $(OUTPUT_FILE)
