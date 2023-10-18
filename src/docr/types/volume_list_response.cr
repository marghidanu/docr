require "json"

module Docr::Types
  class VolumeListResponse
    include JSON::Serializable

    @[JSON::Field(key: "Volumes")]
    property volumes : Array(Docr::Types::Volume)?

    @[JSON::Field(key: "Warnings")]
    property warnings : Array(String)?
  end
end
