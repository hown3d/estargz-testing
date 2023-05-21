#!/usr/bin/env bash

SOURCE_IMAGE="docker.io/library/golang:1.20"
NEW_IMAGE="ghcr.io/hown3d/estargz-testing/go:1.20"
nerdctl image pull $SOURCE_IMAGE
ctr-remote image optimize --oci $SOURCE_IMAGE $NEW_IMAGE
nerdctl image push $NEW_IMAGE

echo $NEW_IMAGE

