require "json"

module Docr::Types
  struct AuthConfig
    include JSON::Serializable

    @[JSON::Field(key: "username")]
    property username : String

    @[JSON::Field(key: "password")]
    property password : String

    @[JSON::Field(key: "email")]
    property email : String

    @[JSON::Field(key: "serveraddress")]
    property serveraddress : String

    def initialize(
      @username,
      @password,
      @email,
      @serveraddress
    )
    end
  end
end
