require "json"

module Docr::Types
  class DriverConfig
    include JSON::Serializable

    @[JSON::Field(key: "Name")]
    property name : String

    @[JSON::Field(key: "Options")]
    property options : Hash(String, String)

    def initialize(@name, @options)
    end
  end

  class BindOptions
    include JSON::Serializable

    @[JSON::Field(key: "Propagation")]
    property propagation : String

    @[JSON::Field(key: "NonRecursive")]
    property non_recursive : Bool = false

    def initialize(@propagation, @non_recursive = false)
    end
  end

  class VolumeOptions
    include JSON::Serializable

    @[JSON::Field(key: "NoCopy")]
    property no_copy : Bool = false

    @[JSON::Field(key: "Labels")]
    property labels : Hash(String, String)?

    @[JSON::Field(key: "DriverConfig")]
    property driver_config : Docr::Types::DriverConfig?
  end

  class TmpfsOptions
    include JSON::Serializable

    @[JSON::Field(key: "SizeBytes")]
    property size_bytes : Int64

    @[JSON::Field(key: "Mode")]
    property mode : Int64

    def initialize(@size_bytes, @mode)
    end
  end

  class Mount
    include JSON::Serializable

    @[JSON::Field(key: "Source")]
    property source : String

    @[JSON::Field(key: "Type")]
    property type : String

    @[JSON::Field(key: "Target")]
    property target : String?

    @[JSON::Field(key: "ReadOnly")]
    property read_only : Bool?

    @[JSON::Field(key: "Consistency")]
    property consistency : String?

    @[JSON::Field(key: "BindOptions")]
    property bind_options : Docr::Types::BindOptions?

    @[JSON::Field(key: "VolumeOptions")]
    property volume_options : Docr::Types::VolumeOptions?

    @[JSON::Field(key: "TmpfsOptions")]
    property tmpfs_options : Docr::Types::TmpfsOptions?

    def initialize(
      @source,
      @type,
      @target = nil,
      @read_only = nil,
      @consistency = nil,
      @bind_options = nil,
      @volume_options = nil,
      @tmpfs_options = nil
    )
    end
  end
end
