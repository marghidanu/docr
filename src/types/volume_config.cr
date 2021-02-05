require "json"

module Docr::Types
  struct VolumeConfig
    include JSON::Serializable

    # The new volume's name. If not specified, Docker generates a name.
    @[JSON::Field(key: "Name")]
    property name : String

    # Name of the volume driver to use.
    @[JSON::Field(key: "Driver")]
    property driver : String

    # A mapping of driver options and values. These options are passed directly to the driver and are driver specific.
    @[JSON::Field(key: "DriverOpts")]
    property driver_opts : Hash(String, String)?

    # User-defined key/value metadata.
    @[JSON::Field(key: "Labels")]
    property labels : Hash(String, String)?

    def initialize(
      @name,
      @driver = "local",
      @driver_opts = nil,
      @labels = nil
    )
    end
  end
end
