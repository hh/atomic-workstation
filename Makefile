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
HYPERV_SWITCH :=

all: virtualbox hyperv

# VirtualBox
virtualbox: $(foreach build,$(BUILDS),virtualbox/$(build))

virtualbox/%:
	$(PYTHON) $(TEMPLATE) $(UPLOAD) | $(PACKER) build \
		-only=virtualbox-iso \
		-var-file=$*.json \
		-var-file=version.json \
		-

# Hyper-V
hyperv: $(foreach build,$(BUILDS),hyperv/$(build))

hyperv/%:
	$(PYTHON) $(TEMPLATE) $(UPLOAD) | $(PACKER) build \
		-only=hyperv-iso \
		-var-file=$*.json \
		-var-file=version.json \
		-var "hyperv_switch=$(HYPERV_SWITCH)" \
		-
