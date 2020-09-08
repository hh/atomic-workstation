#!/bin/bash -eux
if [ -n "$SYSTEMD_TARGET" ]; then
    echo "==> Changing systemd target"
    systemctl set-default "$SYSTEMD_TARGET"
fi
