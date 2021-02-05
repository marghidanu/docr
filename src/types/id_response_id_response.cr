require "json"

module Docr::Types
  struct IdResponseIdResponse
    include JSON::Serializable

    @[JSON::Field(key: "Id")]
    property id : String
  end
end
