# docr

![CI](https://github.com/marghidanu/docr/workflows/CI/badge.svg)

Docker client for Crystal. 

 ## Description

This is still work in progress:

* [ ] Test all endpoint functions
* [ ] Make sure models are complete
* [ ] Extend client to support calls over network

PRs are always welcomed!

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     docr:
       github: marghidanu/docr
   ```

2. Run `shards install`

## Usage

```crystal
require "docr"
```

## Supported API calls

### Containers

* [x] ContainerList
* [x] ContainerCreate
* [x] ContainerInspect
* [x] ContainerTop
* [x] ContainerLogs
* [x] ContainerChanges
* [ ] ContainerStats
* [x] ContainerStart
* [x] ContainerStop
* [x] ContainerRestart
* [x] ContainerKill
* [ ] ContainerUpdate
* [ ] ContainerRename
* [x] ContainerPause
* [x] ContainerUnpause
* [ ] ContainerAttach
* [x] ContainerWait
* [x] ContainerDelete

### Images

* [x] ImageList
* [ ] ImageBuild
* [x] ImageCreate
* [x] ImageInspect
* [x] ImageHistory
* [~] ImagePush
* [x] ImageTag
* [~] ImageDelete

### Networks

* [x] NetworkList
* [x] NetworkCreate
* [x] NetworkInspect
* [ ] NetworkConnect
* [ ] NetworkDisconnect
* [x] NetworkDelete

### Volumes

* [x] VolumeList
* [x] VolumeCreate
* [x] VolumeInspect
* [x] VolumeDelete

### Exec

* [x] ContainerExec
* [x] ExecStart
* [x] ExecInspect

### System

* [x] SystemAuth
* [x] SystemInfo
* [x] SystemVersion
* [x] SystemPing
* [x] SystemEvents
* [ ] SystemDataUsage

## Contributors

- [Tudor Marghidanu](https://github.com/marghidanu) - creator and maintainer

[Contribution guidelines for this project](docs/CONTRIBUTING.md)
