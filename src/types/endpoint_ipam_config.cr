require "json"

module Docr::Types
  class EndpointIPAMConfig
    include JSON::Serializable

    @[JSON::Field(key: "IPv4Address")]
    property ipv4_address : String

    @[JSON::Field(key: "IPv6Address")]
    property ipv6_address : String

    @[JSON::Field(key: "LinkLocalIPs")]
    property link_local_ips : Array(String)
  end
end
