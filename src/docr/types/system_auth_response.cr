require "json"

module Docr::Types
  class SystemAuthResponse
    include JSON::Serializable

    # The status of the authentication
    @[JSON::Field(key: "Status")]
    property status : String

    # An opaque token used to authenticate a user after a successful login
    @[JSON::Field(key: "IdentityToken")]
    property identity_token : String
  end
end
