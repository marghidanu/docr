require "json"

module Docr::Models
  struct NetworkConfig
    include JSON::Serializable

    # The network's name.
    @[JSON::Field(key: "Name")]
    property name : String

    # Check for networks with duplicate names.
    @[JSON::Field(key: "CheckDuplicate")]
    property check_duplicate : Bool?

    # Name of the network driver plugin to use.
    @[JSON::Field(key: "Driver")]
    property driver : String

    # Restrict external access to the network.
    @[JSON::Field(key: "Internal")]
    property internal : Bool?

    # Globally scoped network is manually attachable by regular containers from workers in swarm mode.
    @[JSON::Field(key: "Attachable")]
    property attachable : Bool?

    # Ingress network is the network which provides the routing-mesh in swarm mode.
    @[JSON::Field(key: "Ingress")]
    property ingress : Bool?

    # Optional custom IP scheme for the network.
    @[JSON::Field(key: "IPAM")]
    property ipam : Docr::Models::IPAM?

    # Enable IPv6 on the network.
    @[JSON::Field(key: "EnableIPv6")]
    property enable_ipv6 : Bool?

    #   Network specific options to be used by the drivers.
    @[JSON::Field(key: "Options")]
    property options : Hash(String, String)?

    # User-defined key/value metadata.
    @[JSON::Field(key: "Labels")]
    property labels : Hash(String, String)?

    def initialize(@name, @check_duplicate = nil, @driver = "bridge", @internal = nil, @attachable = nil, @ingress = nil, @ipam = nil, @enable_ipv6 = nil, @options = nil, @labels = nil)
    end
  end
end
