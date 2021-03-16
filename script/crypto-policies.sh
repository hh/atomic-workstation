#!/bin/bash -eux
if [ "x${CRYPTO_POLICY}" != "x" ]; then
    if [ ! $(which update-crypto-policies > /dev/null) ]; then
        echo "==> Installing crypto-policies-scripts"
        rpm-ostree install crypto-policies-scripts
        rpm-ostree ex livefs
    fi
    echo "==> Setting system crypto policy"
    update-crypto-policies --set ${CRYPTO_POLICY}
fi
