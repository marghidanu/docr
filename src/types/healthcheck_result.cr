require "json"

module Docr::Types
  struct HealthcheckResult
    include JSON::Serializable

    @[JSON::Field(key: "Start")]
    property start_check : String

    @[JSON::Field(key: "End")]
    property end_check : String

    @[JSON::Field(key: "ExitCode")]
    property exit_code : Int64

    @[JSON::Field(key: "Output")]
    property output : String
  end
end
