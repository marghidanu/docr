require "json"

module Docr::Types
  struct ProcessConfig
    include JSON::Serializable

    @[JSON::Field(key: "privileged")]
    property privileged : Bool

    @[JSON::Field(key: "user")]
    property user : String

    @[JSON::Field(key: "tty")]
    property tty : Bool

    @[JSON::Field(key: "entrypoint")]
    property entrypoint : String

    @[JSON::Field(key: "arguments")]
    property arguments : Array(String)
  end
end
