require "json"

module Docr::Types
  class ExecInspectResponse
    include JSON::Serializable

    @[JSON::Field(key: "CanRemove")]
    property can_remove : Bool

    @[JSON::Field(key: "DetachKeys")]
    property detach_keys : String

    @[JSON::Field(key: "ID")]
    property id : String

    @[JSON::Field(key: "Running")]
    property running : Bool

    @[JSON::Field(key: "ExitCode")]
    property exit_code : Int64

    @[JSON::Field(key: "ProcessConfig")]
    property process_config : Docr::Types::ProcessConfig

    @[JSON::Field(key: "OpenStdin")]
    property open_stdin : Bool

    @[JSON::Field(key: "OpenStderr")]
    property open_stderr : Bool

    @[JSON::Field(key: "OpenStdout")]
    property open_stdout : Bool

    @[JSON::Field(key: "ContainerID")]
    property container_id : String

    @[JSON::Field(key: "Pid")]
    property pid : Int64
  end
end
