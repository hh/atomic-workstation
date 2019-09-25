#!/bin/bash -eux
echo "==> Adding OSTree remote"
ostree remote delete $OSTREE_REMOTE_NAME

if [ ! "$OSTREE_GPG_KEY" ]; then
    ostree remote add $OSTREE_REMOTE_NAME --set=gpg-verify=false $OSTREE_REMOTE
    exit 0
fi

CONTENTURL_OPTS=""
if [ "$OSTREE_REMOTE_CONTENTURL" ]; then
    CONTENTURL_OPTS="--contenturl=$OSTREE_REMOTE_CONTENTURL"
fi

ostree remote add \
    --set=gpgkeypath=$OSTREE_GPG_KEY \
    --set=gpg-verify=true \
    $CONTENTURL_OPTS \
    $OSTREE_REMOTE_NAME \
    $OSTREE_REMOTE
