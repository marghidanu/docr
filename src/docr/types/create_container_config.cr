require "json"

module Docr::Types
  class CreateContainerConfig < Docr::Types::ContainerConfig
    include JSON::Serializable

    @[JSON::Field(key: "HostConfig")]
    property host_config : Docr::Types::HostConfig?

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
      @healthcheck = nil,
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
      @shell = nil,
      @host_config = nil,
      @exposed_ports = nil
    )
    end
  end
end
