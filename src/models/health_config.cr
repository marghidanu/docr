require "json"

module Docr::Models
  struct HealthConfig
    include JSON::Serializable

    # The test to perform.
    @[JSON::Field(key: "Test")]
    property test : Array(String)

    # The time to wait between checks in nanoseconds.
    @[JSON::Field(key: "Interval")]
    property interval : Int64

    # The time to wait before considering the check to have hung.
    @[JSON::Field(key: "Timeout")]
    property timeout : Int64

    # The number of consecutive failures needed to consider a container as unhealthy.
    @[JSON::Field(key: "Retries")]
    property retries : Int64

    # Start period for the container to initialize before starting health-retries countdown in nanoseconds.
    @[JSON::Field(key: "StartPeriod")]
    property start_period : Int64
  end
end
