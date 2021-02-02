require "json"

module Docr::Models
  struct ContainerCreateResponse
    include JSON::Serializable

    # The ID of the created container
    @[JSON::Field(key: "Id")]
    property id : String

    # Warnings encountered when creating the container
    @[JSON::Field(key: "Warnings")]
    property warnings : Array(String)
  end
end
