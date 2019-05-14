VAGRANT_CLOUD_TOKEN :=
HYPERV_SWITCH :=

PACKER := packer
ifeq ($(OS),Windows_NT)
	PYTHON := py -3
else
	PYTHON := python3
endif

TEMPLATE := atomic-workstation.py

# ----

define build_box
	$(PYTHON) $(TEMPLATE) $(UPLOAD) | $(PACKER) build \
		-only=$(2) \
		-var-file=$(1).json \
		-var-file=version.json \
		-var "hyperv_switch=$(HYPERV_SWITCH)" \
		-var "vagrant_cloud_token=$(VAGRANT_CLOUD_TOKEN)" \
		-
endef

# ----

%: virtualbox/% hyperv/%
	# need a line here?

virtualbox/%:
	$(call build_box,$*,virtualbox-iso)

hyperv/%:
	$(call build_box,$*,hyperv-iso)
