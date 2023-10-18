require "json"

module Docr::Types
  class UsageData
    include JSON::Serializable

    # Amount of disk space used by the volume (in bytes)
    @[JSON::Field(key: "Size")]
    property size : Int64

    @[JSON::Field(key: "RefCount")]
    property ref_count : Int64 = -1
  end

  class Volume
    include JSON::Serializable

    # Name of the volume.
    @[JSON::Field(key: "Name")]
    property name : String

    # Name of the volume driver used by the volume.
    @[JSON::Field(key: "Driver")]
    property driver : String

    # Mount path of the volume on the host.
    @[JSON::Field(key: "Mountpoint")]
    property mountpoint : String

    # Date/Time the volume was created.
    @[JSON::Field(key: "CreatedAt")]
    property created_at : String

    # Low-level details about the volume, provided by the volume driver.
    @[JSON::Field(key: "Status")]
    property status : Hash(String, Hash(String, String))?

    # User-defined key/value metadata.
    @[JSON::Field(key: "Labels")]
    property labels : Hash(String, String)?

    # The level at which the volume exists. Either `global` for cluster-wide, or `local` for machine level.
    @[JSON::Field(key: "Scope")]
    property scope : String

    # The driver specific options used when creating the volume.
    @[JSON::Field(key: "Options")]
    property options : Hash(String, String)?

    @[JSON::Field(key: "UsageData")]
    property usage_data : Docr::Types::UsageData?
  end
end
