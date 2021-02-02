require "json"

module Docr::Models
  struct Network
    include JSON::Serializable

    @[JSON::Field(key: "Name")]
    property name : String

    @[JSON::Field(key: "Id")]
    property id : String

    @[JSON::Field(key: "Created")]
    property created : String

    @[JSON::Field(key: "Scope")]
    property scope : String

    @[JSON::Field(key: "Driver")]
    property driver : String

    @[JSON::Field(key: "EnableIPv6")]
    property enable_ipv6 : Bool

    @[JSON::Field(key: "IPAM")]
    property ipam : Docr::Models::IPAM?

    @[JSON::Field(key: "Internal")]
    property internal : Bool

    @[JSON::Field(key: "Attachable")]
    property attachable : Bool

    @[JSON::Field(key: "Ingress")]
    property ingress : Bool

    @[JSON::Field(key: "Containers")]
    property containers : Hash(String, Docr::Models::NetworkContainer)

    @[JSON::Field(key: "Options")]
    property options : Hash(String, String)

    @[JSON::Field(key: "Labels")]
    property labels : Hash(String, String)
  end
end
