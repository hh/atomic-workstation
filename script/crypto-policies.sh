#!/bin/bash -eux
if [ "x${CRYPTO_POLICY}" != "x" ]; then
    echo "==> Setting system crypto policy"
    update-crypto-policies --set ${CRYPTO_POLICY}
fi
