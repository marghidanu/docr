require "json"

module Docr::Models
  struct ImageSummary
    include JSON::Serializable

    @[JSON::Field(key: "Id")]
    property id : String

    @[JSON::Field(key: "ParentId")]
    property parent_id : String

    @[JSON::Field(key: "RepoTags")]
    property repo_tags : Array(String)

    @[JSON::Field(key: "RepoDigests")]
    property repo_digests : Array(String)?

    @[JSON::Field(key: "Created")]
    property created : Int64

    @[JSON::Field(key: "Size")]
    property size : Int64

    @[JSON::Field(key: "SharedSize")]
    property shared_size : Int64

    @[JSON::Field(key: "VirtualSize")]
    property virtual_size : Int64

    @[JSON::Field(key: "Labels")]
    property labels : Hash(String, String)?

    @[JSON::Field(key: "Containers")]
    property containers : Int64
  end
end
