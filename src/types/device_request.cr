require "json"

module Docr::Types
  struct DeviceRequest
    include JSON::Serializable

    @[JSON::Field(key: "Driver")]
    property driver : String

    @[JSON::Field(key: "Count")]
    property count : Int64

    @[JSON::Field(key: "DeviceIDs")]
    property device_ids : Array(String)

    @[JSON::Field(key: "Capabilities")]
    property capabilities : Array(Array(String))

    @[JSON::Field(key: "Options")]
    property options : Hash(String, String)
  end
end
