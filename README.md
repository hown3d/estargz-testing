# eStargz

= extended Seekable tar.gz
https://github.com/containerd/stargz-snapshotter/blob/main/docs/estargz.md

## Optimizing images into eStargz 

https://github.com/containerd/stargz-snapshotter/blob/main/docs/ctr-remote.md

Though lazy pull speeds up the container's startup, it's possible, especially with slow network, that the runtime performance becomes lower because reading files can induce remotely downloading file contents. For mitigating this, ctr-remote also allows to optimize the image against the workload the image runs.

When you run ctr-remote image optimize, this runs the source image as a container and profiles all file accesses during the execution. Then these accessed files are marked as "prioritized" files and will be prefetched on runtime.


## Integration in BuildKit

https://github.com/moby/buildkit/blob/aba69fa102184a8ba027f6c0f7b8b46acbad697a/docs/stargz-estargz.md