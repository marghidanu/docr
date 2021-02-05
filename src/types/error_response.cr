require "json"

module Docr::Types
  struct ErrorResponse
    include JSON::Serializable

    @[JSON::Field(key: "message")]
    property message : String
  end
end
