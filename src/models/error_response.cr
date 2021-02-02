require "json"

module Docr::Models
  struct ErrorResponse
    include JSON::Serializable

    @[JSON::Field(key: "message")]
    property message : String
  end
end
