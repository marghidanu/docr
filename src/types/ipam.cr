require "json"

module Docr::Types
  class IPAM
    include JSON::Serializable

    # Name of the IPAM driver to use.
    @[JSON::Field(key: "Driver")]
    property driver : String

    # List of IPAM configuration options,
    @[JSON::Field(key: "Config")]
    property config : Array(Hash(String, String))

    # Driver-specific options, specified as a map.
    @[JSON::Field(key: "Options")]
    property options : Hash(String, String)?
  end
end
