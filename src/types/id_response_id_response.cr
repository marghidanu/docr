require "json"

module Docr::Types
  class IdResponseIdResponse
    include JSON::Serializable

    @[JSON::Field(key: "Id")]
    property id : String
  end
end
