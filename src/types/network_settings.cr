require "json"

module Docr::Types
  struct NetworkSettings
    include JSON::Serializable

    @[JSON::Field(key: "Bridge")]
    property bridge : String

    @[JSON::Field(key: "SandboxID")]
    property sandbox_id : String

    @[JSON::Field(key: "HairpinMode")]
    property hairpin_mode : Bool

    @[JSON::Field(key: "LinkLocalIPv6Address")]
    property link_local_ipv6_address : String

    @[JSON::Field(key: "LinkLocalIPv6PrefixLen")]
    property link_local_ipv6_prefix_len : Int64

    @[JSON::Field(key: "Ports")]
    property ports : Hash(String, Array(Docr::Types::PortBinding)?)

    @[JSON::Field(key: "SandboxKey")]
    property sandbox_key : String

    @[JSON::Field(key: "SecondaryIPAddresses")]
    property secondary_ip_addresses : Array(Docr::Types::Address)?

    @[JSON::Field(key: "SecondaryIPv6Addresses")]
    property secondary_ipv6_addresses : Array(Docr::Types::Address)?

    @[JSON::Field(key: "EndpointID")]
    property endpoint_id : String

    @[JSON::Field(key: "Gateway")]
    property gateway : String

    @[JSON::Field(key: "GlobalIPv6Address")]
    property global_ipv6_address : String

    @[JSON::Field(key: "GlobalIPv6PrefixLen")]
    property global_ipv6_prefix_len : Int64

    @[JSON::Field(key: "IPAddress")]
    property ip_address : String

    @[JSON::Field(key: "IPPrefixLen")]
    property ip_prefix_len : Int64

    @[JSON::Field(key: "IPv6Gateway")]
    property ipv6_gateway : String

    @[JSON::Field(key: "MacAddress")]
    property mac_address : String

    @[JSON::Field(key: "Networks")]
    property networks : Hash(String, Docr::Types::EndpointSettings)
  end
end
