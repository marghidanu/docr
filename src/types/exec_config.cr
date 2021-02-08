require "json"

module Docr::Types
  class ExecConfig
    @[JSON::Field(key: "AttachStdin")]
    property attach_stdin : Bool?

    @[JSON::Field(key: "AttachStdout")]
    property attach_stdout : Bool?

    @[JSON::Field(key: "AttachStderr")]
    property attach_stderr : Bool?

    @[JSON::Field(key: "DetachKeys")]
    property detach_keys : String?

    @[JSON::Field(key: "Tty")]
    property tty : Bool?

    @[JSON::Field(key: "Env")]
    property env : Array(String)?

    @[JSON::Field(key: "Cmd")]
    property cmd : Array(String)?

    @[JSON::Field(key: "Privileged")]
    property privileged : Bool?

    @[JSON::Field(key: "User")]
    property user : String?

    @[JSON::Field(key: "WorkingDir")]
    property working_dir : String?

    def initialize(
      @attach_stdin = nil,
      @attach_stdout = nil,
      @attach_stderr = nil,
      @detach_keys = nil,
      @tty = nil,
      @env = nil,
      @cmd = nil,
      @privileged = nil,
      @user = nil,
      @working_dir = nil
    )
    end
  end
end
