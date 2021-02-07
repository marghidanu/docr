require "json"

module Docr::Types
  struct EndpointSettings
    include JSON::Serializable

    @[JSON::Field(key: "IPAMConfig")]
    property ipam_config : Docr::Types::EndpointIPAMConfig?

    @[JSON::Field(key: "Links")]
    property links : Array(String)?

    @[JSON::Field(key: "Aliases")]
    property aliases : Array(String)?

    @[JSON::Field(key: "NetworkID")]
    property network_id : String

    @[JSON::Field(key: "EndpointID")]
    property endpoint_id : String

    @[JSON::Field(key: "Gateway")]
    property gateway : String

    @[JSON::Field(key: "IPAddress")]
    property ip_address : String

    @[JSON::Field(key: "IPPrefixLen")]
    property ip_prefix_len : Int64

    @[JSON::Field(key: "IPv6Gateway")]
    property ipv6_gateway : String

    @[JSON::Field(key: "GlobalIPv6Address")]
    property global_ipv6_address : String

    @[JSON::Field(key: "GlobalIPv6PrefixLen")]
    property global_ipv6_prefix_len : Int64

    @[JSON::Field(key: "MacAddress")]
    property mac_address : String

    @[JSON::Field(key: "DriverOpts")]
    property driver_opts : Hash(String, String)?
  end
end
