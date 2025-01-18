require "json"

module Docr::Types
  class PortBinding
    include JSON::Serializable

    @[JSON::Field(key: "HostIp")]
    property host_ip : String?

    @[JSON::Field(key: "HostPort")]
    property host_port : String?

    def initialize(
      @host_ip = nil,
      @host_port = nil,
    )
    end
  end
end
