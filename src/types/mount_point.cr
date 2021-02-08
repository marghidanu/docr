require "json"

module Docr::Types
  class MountPoint
    include JSON::Serializable

    @[JSON::Field(key: "Type")]
    property type : String

    @[JSON::Field(key: "Name")]
    property name : String

    @[JSON::Field(key: "Source")]
    property source : String

    @[JSON::Field(key: "Destination")]
    property destination : String

    @[JSON::Field(key: "Driver")]
    property driver : String

    @[JSON::Field(key: "Mode")]
    property mode : String

    @[JSON::Field(key: "RW")]
    property rw : Bool

    @[JSON::Field(key: "Propagation")]
    property propagation : String
  end
end
