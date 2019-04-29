BUILDS := \
	fedora27-atomic-workstation \
	fedora28-atomic-workstation \
	fedora29-silverblue \
	fedora30-silverblue

TEMPLATE := atomic-workstation.py
PACKER := packer
ifeq ($(OS),Windows_NT)
	PYTHON := py -3
else
	PYTHON := python3
endif

all: virtualbox/all

virtualbox/all: $(foreach build,$(BUILDS),virtualbox/$(build))

virtualbox/%:
	$(PYTHON) $(TEMPLATE) $(UPLOAD) | $(PACKER) build -only=virtualbox-iso -var-file=$*.json -var-file=version.json -
