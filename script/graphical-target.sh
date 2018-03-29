#!/bin/bash -eux
echo "==> Enabling GUI"
systemctl set-default graphical.target
