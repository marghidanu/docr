require "json"

module Docr::Types
  class ContainerWaitResponse
    include JSON::Serializable

    @[JSON::Field(key: "StatusCode")]
    property status_code : Int64

    @[JSON::Field(key: "Error")]
    property error : Hash(String, String)?
  end
end
