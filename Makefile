# Include config if exists
-include  config.make

# Put these into config.make to override with your setup
RESUME ?= jpiel.yaml

PYTHON ?= $(shell which python3)
BUILD_DIR ?= build/
BUILD_ARGS ?= --output_dir $(BUILD_DIR)
BUILD ?= $(PYTHON) build.py $(BUILD_ARGS)

.PHONY: clean html pdf 

all: clean html pdf

html:
	$(BUILD) --format html resumes/$(RESUME)
	@echo "Done"

pdf:
	$(BUILD) --format pdf resumes/$(RESUME)

clean:
	@rm -rf ./build
