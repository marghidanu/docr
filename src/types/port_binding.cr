require "json"

module Docr::Types
  struct PortBinding
    include JSON::Serializable

    @[JSON::Field(key: "HostIp")]
    property host_ip : String

    @[JSON::Field(key: "HostPort")]
    property host_port : String
  end
end
