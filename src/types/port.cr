require "json"

module Docr::Types
  struct Port
    include JSON::Serializable

    @[JSON::Field(key: "IP")]
    property ip : String? # format: "ip-address"

    @[JSON::Field(key: "PrivatePort")]
    property private_port : UInt16

    @[JSON::Field(key: "PublicPort")]
    property public_port : UInt16?

    @[JSON::Field(key: "Type")]
    property type : String # enum: ["tcp", "udp", "sctp"]
  end
end
