#!/usr/bin/env bash

docker run -it --rm --privileged \
  -v $PWD/configs/buildkitd.toml:/etc/buildkit/buildkitd.toml \
  -v $PWD/configs/containerd.toml:/etc/containerd/containerd.toml \
  -v $PWD:/work \
  -w /work \
  ghcr.io/containerd/nerdctl:v1.4.0 \
  $@