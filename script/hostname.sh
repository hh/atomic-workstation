#!/bin/bash -eux
echo "==> Setting hostname to $HOSTNAME"
hostnamectl set-hostname $HOSTNAME
