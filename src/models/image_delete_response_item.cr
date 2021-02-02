require "json"

module Docr::Models
  struct ImageDeleteResponseItem
    include JSON::Serializable

    # The image ID of an image that was untagged
    @[JSON::Field(key: "Untagged")]
    property untagged : String?

    # The image ID of an image that was deleted
    @[JSON::Field(key: "Deleted")]
    property deleted : String?
  end
end
