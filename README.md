# docr

TODO: Write a description here

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

TODO: Write usage instructions here

## Development

TODO: Write development instructions here

## Supported API calls

### Containers

* [ ] ContainerList
* [ ] ContainerCreate
* [ ] ContainerInspect
* [ ] ContainerTop
* [ ] ContainerLogs
* [ ] ContainerChanges
* [ ] ContainerStats
* [ ] ContainerStart
* [ ] ContainerStop
* [ ] ContainerRestart
* [ ] ContainerKill
* [ ] ContainerUpdate
* [ ] ContainerRename
* [ ] ContainerPause
* [ ] ContainerAttach
* [ ] ContainerWait
* [ ] ContainerDelete

### Images

* [x] ImageList
* [ ] ImageBuild
* [ ] ImageCreate
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

* [ ] ContainerExec
* [ ] ExecStart
* [ ] ExecInspect

### System

* [x] SystemAuth
* [x] SystemInfo
* [x] SystemVersion
* [x] SystemPing
* [x] SystemEvents
* [ ] SystemDataUsage

## Contributing

1. Fork it (<https://github.com/marghidanu/docr/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Tudor Marghidanu](https://github.com/marghidanu) - creator and maintainer
