require "json"

module Docr::Models
  struct ContainerChangeResponseItem
    include JSON::Serializable

    @[JSON::Field(key: "Path")]
    property path : String

    @[JSON::Field(key: "Kind")]
    property kind : UInt8
  end
end
