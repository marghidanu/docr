require "json"

module Docr::Types
  struct ContainerState
    include JSON::Serializable

    @[JSON::Field(key: "Status")]
    property status : String

    @[JSON::Field(key: "Running")]
    property running : Bool

    @[JSON::Field(key: "Paused")]
    property paused : Bool

    @[JSON::Field(key: "Restarting")]
    property restarting : Bool

    @[JSON::Field(key: "OOMKilled")]
    property oom_killed : Bool

    @[JSON::Field(key: "Dead")]
    property dead : Bool

    @[JSON::Field(key: "Pid")]
    property pid : Int64

    @[JSON::Field(key: "ExitCode")]
    property exit_code : Int32

    @[JSON::Field(key: "Error")]
    property error : String

    @[JSON::Field(key: "StartedAt")]
    property started_at : String

    @[JSON::Field(key: "FinishedAt")]
    property finished_at : String

    @[JSON::Field(key: "Health")]
    property health : Docr::Types::Health?
  end
end
