#!/usr/bin/env bash

set -ex

IMAGE_NAME="ghcr.io/hown3d/estargz-testing/test-image:test"
BUILD_ARGS=()
OUTPUT=(
"type=image"
"name=$IMAGE_NAME"
"oci-mediatypes=true"
)
if [[ -n $ESTARGZ ]]; then
  BUILD_ARGS+=(
  --build-arg BASE_IMAGE="ghcr.io/stargz-containers/golang:1.18-esgz"
  )
  OUTPUT+=("compression=estargz")
fi

printf -v OUTPUT_STRING "%s," ${OUTPUT[@]}
#remove last comma
OUTPUT_STRING=${OUTPUT_STRING%?}

echo waiting for boot
sleep 10

cat gh_token | nerdctl login -u hown3d --password-stdin ghcr.io

nerdctl --snapshotter=stargz build \
  ${BUILD_ARGS[@]} \
  --output $OUTPUT_STRING \
  .

if [[ -n $ESTARGZ ]]; then
ctr-remote image optimize --oci --reuse $IMAGE_NAME ${IMAGE_NAME}-opt
nerdctl push --all-platforms ${IMAGE_NAME}-opt
fi

nerdctl push --all-platforms ${IMAGE_NAME}
