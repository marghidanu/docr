require "json"

module Docr::Types
  struct ContainerConfig
    include JSON::Serializable

    @[JSON::Field(key: "Hostname")]
    property hostname : String?

    @[JSON::Field(key: "Domainname")]
    property domainname : String?

    @[JSON::Field(key: "User")]
    property user : String?

    @[JSON::Field(key: "AttachStdin")]
    property attach_stdin : Bool? = false

    @[JSON::Field(key: "AttachStdout")]
    property attach_stdout : Bool? = true

    @[JSON::Field(key: "AttachStderr")]
    property attach_stderr : Bool? = true

    @[JSON::Field(key: "Tty")]
    property tty : Bool? = false

    @[JSON::Field(key: "OpenStdin")]
    property open_stdin : Bool? = false

    @[JSON::Field(key: "StdinOnce")]
    property stdin_once : Bool? = false

    @[JSON::Field(key: "Env")]
    property env : Array(String)?

    @[JSON::Field(key: "Cmd")]
    property cmd : Array(String)?

    @[JSON::Field(key: "ArgsEscaped")]
    property args_escaped : Bool?

    @[JSON::Field(key: "Image")]
    property image : String?

    @[JSON::Field(key: "WorkingDir")]
    property working_dir : String?

    @[JSON::Field(key: "Entrypoint")]
    property entrypoint : Array(String)?

    @[JSON::Field(key: "NetworkDisabled")]
    property network_disabled : Bool?

    @[JSON::Field(key: "MacAddress")]
    property mac_address : String?

    @[JSON::Field(key: "OnBuild")]
    property on_build : Array(String)?

    @[JSON::Field(key: "Labels")]
    property labels : Hash(String, String)?

    @[JSON::Field(key: "StopSignal")]
    property stop_signal : String?

    @[JSON::Field(key: "StopTimeout")]
    property stop_timeout : Int32?

    @[JSON::Field(key: "Shell")]
    property shell : Array(String)?

    def initialize(
      @hostname = nil,
      @domainname = nil,
      @user = nil,
      @attach_stdin = false,
      @attach_stdout = true,
      @attach_stderr = true,
      @tty = false,
      @open_stdin = false,
      @stdin_once = false,
      @env = nil,
      @cmd = nil,
      @args_escaped = nil,
      @image = nil,
      @working_dir = nil,
      @entrypoint = nil,
      @network_disabled = nil,
      @mac_address = nil,
      @on_build = nil,
      @labels = nil,
      @stop_signal = "SIGTERM",
      @stop_timeout = 10,
      @shell = nil
    )
    end
  end
end

#   ExposedPorts:
#     type: "object"
#     additionalProperties:
#       type: "object"
#       enum:
#         - {}
#       default: {}
#   Healthcheck:
#     $ref: "#/definitions/HealthConfig"
#   Volumes:
#     type: "object"
#     additionalProperties:
#       type: "object"
#       enum:
#         - {}
#       default: {}
