# Include config if exists
-include  config.make

# Put these into config.make to override with your setup
RESUME ?= resumes/example.yaml
RSYNC_LOCATION ?= example.com:/var/www/resume/

PYTHON ?= $(shell which python3)
RSYNC ?= $(shell which rsync)
RSYNC_ARGS ?= av
BUILD_DIR ?= build/
BUILD_ARGS ?= --output_dir $(BUILD_DIR)
BUILD ?= $(PYTHON) build.py $(BUILD_ARGS)
DOCKER_TAG ?= mshade/resume:latest
DOCKER ?= docker build . -t $(DOCKER_TAG)
DOCKER_PUSH ?= docker push $(DOCKER_TAG)


.PHONY: clean html pdf publish

all: clean html pdf

html:
	$(BUILD) --format html $(RESUME)
	@echo "Done"

pdf:
	$(BUILD) --format pdf $(RESUME)

clean:
	@rm -rf ./build

publish:
	$(RSYNC) -$(RSYNC_ARGS) $(BUILD_DIR) $(RSYNC_LOCATION)

docker:
	$(DOCKER)
	$(DOCKER_PUSH)
