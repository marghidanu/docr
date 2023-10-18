require "json"

module Docr::Types
  class ContainerTopResponse
    include JSON::Serializable

    @[JSON::Field(key: "Titles")]
    property titles : Array(String)

    @[JSON::Field(key: "Processes")]
    property processes : Array(Array(String))
  end
end
