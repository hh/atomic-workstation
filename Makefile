HYPERV_SWITCH :=
PACKER_ARGS :=
PACKER := packer
ifeq ($(OS),Windows_NT)
	PYTHON := py -3
else
	PYTHON := python3
endif

TEMPLATE := atomic.py

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

virtualbox/%: vagrant-cloud-token.json
	$(call build_box,$*,virtualbox-iso,$(TEMPLATE))

hyperv/%: vagrant-cloud-token.json
	$(call build_box,$*,hyperv-iso,$(TEMPLATE))

vagrant-cloud-token.json:
	$(PYTHON) -c "f = open('vagrant-cloud-token.json', 'w'); f.write('{\"vagrant_cloud_token\": \"\"}')"
