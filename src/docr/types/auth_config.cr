require "json"

module Docr::Types
  class AuthConfig
    include JSON::Serializable

    @[JSON::Field(key: "username")]
    property username : String?

    @[JSON::Field(key: "password")]
    property password : String?

    @[JSON::Field(key: "email")]
    property email : String?

    @[JSON::Field(key: "serveraddress")]
    property serveraddress : String?

    @[JSON::Field(key: "identitytoken")]
    property identitytoken : String?

    def initialize(
      @username : String,
      @password : String,
      @email : String,
      @serveraddress : String,
    )
    end

    def initialize(@identitytoken : String)
    end
  end
end
