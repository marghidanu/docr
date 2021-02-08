require "json"

module Docr::Types
  class ErrorResponse
    include JSON::Serializable

    @[JSON::Field(key: "message")]
    property message : String
  end
end
