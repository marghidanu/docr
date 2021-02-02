require "json"

module Docr::Models
  struct ContainerWaitResponse
    include JSON::Serializable

    @[JSON::Field(key: "StatusCode")]
    property status_code : Int64

    @[JSON::Field(key: "Error")]
    property error : Hash(String, String)
  end
end
