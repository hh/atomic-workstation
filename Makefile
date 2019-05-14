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
		-var-file=vagrant-cloud-token.json \
		-var "hyperv_switch=$(HYPERV_SWITCH)" \
		-
endef

# ----

virtualbox/%: vagrant-cloud-token.json
	$(call build_box,$*,virtualbox-iso)

hyperv/%: vagrant-cloud-token.json
	$(call build_box,$*,hyperv-iso)

vagrant-cloud-token.json:
	$(PYTHON) -c "f = open('vagrant-cloud-token.json', 'w'); f.write('{\"vagrant_cloud_token\": \"\"}')"
