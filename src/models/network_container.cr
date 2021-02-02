require "json"

module Docr::Models
  struct NetworkContainer
    include JSON::Serializable

    @[JSON::Field(key: "Name")]
    property name : String

    @[JSON::Field(key: "EndpointID")]
    property endpoint_id : String

    @[JSON::Field(key: "MacAddress")]
    property mac_address : String

    @[JSON::Field(key: "IPv4Address")]
    property i_pv4_address : String

    @[JSON::Field(key: "IPv6Address")]
    property i_pv6_address : String
  end
end
