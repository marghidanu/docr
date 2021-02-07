require "json"

module Docr::Types
  struct ContainerSummary
    include JSON::Serializable

    @[JSON::Field(key: "Id")]
    property id : String

    @[JSON::Field(key: "Names")]
    property names : Array(String)

    @[JSON::Field(key: "Image")]
    property image : String

    @[JSON::Field(key: "ImageID")]
    property image_id : String

    @[JSON::Field(key: "Command")]
    property command : String

    @[JSON::Field(key: "Created")]
    property created : Int64

    @[JSON::Field(key: "Ports")]
    property ports : Array(Port)

    @[JSON::Field(key: "SizeRw")]
    property size_rw : Int64?

    @[JSON::Field(key: "SizeRootFs")]
    property size_root_fs : Int64?

    @[JSON::Field(key: "Labels")]
    property labels : Hash(String, String)

    @[JSON::Field(key: "State")]
    property state : String

    @[JSON::Field(key: "Status")]
    property status : String

    @[JSON::Field(key: "Mounts")]
    property mounts : Array(Docr::Types::Mount)
  end
end

# HostConfig:
#   type: "object"
#   properties:
#     NetworkMode:
#       type: "string"
# NetworkSettings:
#   type: "object"
#   properties:
#     Networks:
#       type: "object"
#       additionalProperties:
#         $ref: "#/definitions/EndpointSettings"
