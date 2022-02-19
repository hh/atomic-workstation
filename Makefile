PACKER := packer
PACKER_ARGS :=

%:
	$(PACKER) build \
		$(PACKER_ARGS) \
		-only="*.$(*D)" \
		-var-file="vars/$(*F).pkrvars.hcl" \
		.
