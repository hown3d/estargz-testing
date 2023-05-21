#!/usr/bin/env bash

set -ex

IMAGE_NAME="ghcr.io/hown3d/estargz-testing/test-image:test"
if [[ -n $ESTARGZ ]]; then
IMAGE_NAME="$IMAGE_NAME-opt"
fi

echo waiting for boot
sleep 10

nerdctl run --snapshotter=stargz $IMAGE_NAME
