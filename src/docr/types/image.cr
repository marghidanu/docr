require "json"

module Docr::Types
  class RootFS
    include JSON::Serializable

    @[JSON::Field(key: "Type")]
    property type : String

    @[JSON::Field(key: "Layers")]
    property layers : Array(String)?

    @[JSON::Field(key: "BaseLayer")]
    property base_layer : String?
  end

  class Metadata
    include JSON::Serializable

    @[JSON::Field(key: "LastTagTime")]
    property last_tag_time : String
  end

  class Image
    include JSON::Serializable

    @[JSON::Field(key: "Id")]
    property id : String

    @[JSON::Field(key: "RepoTags")]
    property repo_tags : Array(String)

    @[JSON::Field(key: "RepoDigests")]
    property repo_digests : Array(String)

    @[JSON::Field(key: "Parent")]
    property parent : String

    @[JSON::Field(key: "Comment")]
    property comment : String

    @[JSON::Field(key: "Created")]
    property created : String

    @[JSON::Field(key: "Container")]
    property container : String?

    @[JSON::Field(key: "ContainerConfig")]
    property container_config : Docr::Types::ContainerConfig?

    @[JSON::Field(key: "DockerVersion")]
    property docker_version : String

    @[JSON::Field(key: "Author")]
    property author : String

    @[JSON::Field(key: "Config")]
    property config : Docr::Types::ContainerConfig

    @[JSON::Field(key: "Architecture")]
    property architecture : String

    @[JSON::Field(key: "Os")]
    property os : String

    @[JSON::Field(key: "OsVersion")]
    property os_version : String?

    @[JSON::Field(key: "Size")]
    property size : Int64

    @[JSON::Field(key: "VirtualSize")]
    property virtual_size : Int64?

    @[JSON::Field(key: "GraphDriver")]
    property graph_driver : Docr::Types::GraphDriverData

    @[JSON::Field(key: "RootFS")]
    property root_fs : Docr::Types::RootFS

    @[JSON::Field(key: "Metadata")]
    property metadata : Docr::Types::Metadata
  end
end
