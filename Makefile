BUILDS := \
	fedora27-atomic-workstation \
	fedora28-atomic-workstation

TEMPLATE := atomic-workstation.py

ifeq ($(OS),Windows_NT)
	PYTHON := py -3
else
	PYTHON := python3
endif

all: virtualbox/all

virtualbox/all: $(foreach build,$(BUILDS),virtualbox/$(build))

virtualbox/%:
	$(PYTHON) $(TEMPLATE) $(UPLOAD) | packer build -only=virtualbox-iso -var-file=$*.json -var-file=version.json -
