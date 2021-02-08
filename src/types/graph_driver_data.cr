require "json"

module Docr::Types
  class GraphDriverData
    include JSON::Serializable

    @[JSON::Field(key: "Name")]
    property name : String

    @[JSON::Field(key: "Data")]
    property data : Hash(String, String)
  end
end
