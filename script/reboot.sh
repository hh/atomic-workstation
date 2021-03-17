#!/bin/bash -eux
echo "==> Rebooting to apply any pending deployment..."
systemctl reboot
sleep 60
