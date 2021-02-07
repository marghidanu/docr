require "json"

module Docr::Types
  struct Health
    include JSON::Serializable

    @[JSON::Field(key: "Status")]
    property status : String

    @[JSON::Field(key: "FailingStreak")]
    property failing_streak : Int64

    @[JSON::Field(key: "Log")]
    property log : Array(Docr::Types::HealthcheckResult)
  end
end
