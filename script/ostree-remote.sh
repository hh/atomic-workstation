#!/bin/bash -eux
if [ "$OSTREE_REMOTE" ]; then
    echo "==> Adding OSTree remote"
    ostree remote delete $OSTREE_REMOTE_NAME
    if [ "$OSTREE_GPG_KEY" ]; then
        GPG_OPTS=gpgkeypath=$OSTREE_GPG_KEY
    else
        GPG_OPTS=gpg-verify=false
    fi
    ostree remote add $OSTREE_REMOTE_NAME --set=$GPG_OPTS $OSTREE_REMOTE
fi
