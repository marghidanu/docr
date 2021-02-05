require "json"

module Docr::Types
  struct Address
    include JSON::Serializable

    @[JSON::Field(key: "Addr")]
    property addr : String

    @[JSON::Field(key: "PrefixLen")]
    property prefix_len : Int64
  end
end
