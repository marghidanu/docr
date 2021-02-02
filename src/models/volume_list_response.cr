require "json"

module Docr::Models
  struct VolumeListResponse
    include JSON::Serializable

    @[JSON::Field(key: "Volumes")]
    property volumes : Array(Docr::Models::Volume)?

    @[JSON::Field(key: "Warnings")]
    property warnings : Array(String)?
  end
end
