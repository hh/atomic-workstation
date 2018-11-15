TEMPLATE := atomicws.json
BUILDS := \
	fedora27-atomic-workstation \
	fedora28-atomic-workstation

virtualbox/all: $(foreach build,$(BUILDS),virtualbox/$(build))

virtualbox/%:
	packer build -only=virtualbox-iso -var-file=$*.json $(TEMPLATE)
