#!/bin/bash -eux
if [[ $PACKER_BUILDER_TYPE =~ virtualbox && $INSTALL_GUEST_ADDITIONS =~ true ]]; then
    echo "==> Layering Virtualbox guest additions"
    rpm-ostree install virtualbox-guest-additions
fi
