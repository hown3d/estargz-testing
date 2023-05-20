#!/usr/bin/env bash

UUID=$(uuidgen | tr "[:upper:]" "[:lower:]")
SOURCE_IMAGE="docker.io/library/golang:1.20"
NEW_IMAGE="ttl.sh/$UUID:5m"
sudo ctr-remote image pull $SOURCE_IMAGE
sudo ctr-remote image optimize $SOURCE_IMAGE $NEW_IMAGE
sudo ctr-remote image push $NEW_IMAGE

echo $NEW_IMAGE

