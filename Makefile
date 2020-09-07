HYPERV_SWITCH :=
PACKER_ARGS :=
PACKER := packer
ifeq ($(OS),Windows_NT)
	PYTHON := py -3
else
	PYTHON := python3
endif

# ----

define build_box
	$(PYTHON) $(3) $(UPLOAD) | $(PACKER) build \
		-only=$(2) \
		-var-file=$(1).json \
		-var-file=vagrant-cloud-token.json \
		-var "hyperv_switch=$(HYPERV_SWITCH)" \
		$(PACKER_ARGS) \
		-
endef

# ----

virtualbox/silverblue/%: vagrant-cloud-token.json
	$(call build_box,$*,virtualbox-iso,atomic-workstation.py)

hyperv/silverblue/%: vagrant-cloud-token.json
	$(call build_box,$*,hyperv-iso,atomic-workstation.py)

vagrant-cloud-token.json:
	$(PYTHON) -c "f = open('vagrant-cloud-token.json', 'w'); f.write('{\"vagrant_cloud_token\": \"\"}')"
