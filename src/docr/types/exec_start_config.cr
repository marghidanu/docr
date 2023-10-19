require "json"

module Docr::Types
  class ExecStartConfig
    include JSON::Serializable

    @[JSON::Field(key: "Detach")]
    property detach : Bool?

    @[JSON::Field(key: "Tty")]
    property tty : Bool?

    def initialize(@detach = false, @tty = false)
    end
  end
end
