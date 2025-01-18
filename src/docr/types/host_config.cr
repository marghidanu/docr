require "json"

module Docr::Types
  class LogConfig
    include JSON::Serializable

    @[JSON::Field(key: "Type")]
    property type : String
    @[JSON::Field(key: "Config")]
    property config : Hash(String, String)

    def initialize(
      @type,
      @config,
    )
    end
  end

  class HostConfig
    include JSON::Serializable

    #   - $ref: "#/definitions/Resources"

    @[JSON::Field(key: "Binds")]
    property binds : Array(String)?

    @[JSON::Field(key: "ContainerIDFile")]
    property container_id_file : String?

    @[JSON::Field(key: "LogConfig")]
    property log_config : Docr::Types::LogConfig?

    @[JSON::Field(key: "NetworkMode")]
    property network_mode : String?

    @[JSON::Field(key: "PortBindings")]
    property port_bindings : Hash(String, Array(Docr::Types::PortBinding))?

    @[JSON::Field(key: "RestartPolicy")]
    property restart_policy : Docr::Types::RestartPolicy?

    @[JSON::Field(key: "AutoRemove")]
    property auto_remove : Bool?

    @[JSON::Field(key: "VolumeDriver")]
    property volume_driver : String?

    @[JSON::Field(key: "VolumesFrom")]
    property volumes_from : Array(String)?

    @[JSON::Field(key: "Mounts")]
    property mounts : Array(Docr::Types::Mount)?

    @[JSON::Field(key: "CapAdd")]
    property cap_add : Array(String)?

    @[JSON::Field(key: "CapDrop")]
    property cap_drop : Array(String)?

    @[JSON::Field(key: "CgroupnsMode")]
    property cgroupns_mode : String?

    @[JSON::Field(key: "Dns")]
    property dns : Array(String)?

    @[JSON::Field(key: "DnsOptions")]
    property dns_options : Array(String)?

    @[JSON::Field(key: "DnsSearch")]
    property dns_search : Array(String)?

    @[JSON::Field(key: "ExtraHosts")]
    property extra_hosts : Array(String)?

    @[JSON::Field(key: "GroupAdd")]
    property group_add : Array(String)?

    @[JSON::Field(key: "IpcMode")]
    property ipc_mode : String?

    @[JSON::Field(key: "Cgroup")]
    property cgroup : String?

    @[JSON::Field(key: "Links")]
    property links : Array(String)?

    @[JSON::Field(key: "OomScoreAdj")]
    property oom_score_adj : Int64?

    @[JSON::Field(key: "PidMode")]
    property pid_mode : String?

    @[JSON::Field(key: "Privileged")]
    property privileged : Bool?

    @[JSON::Field(key: "PublishAllPorts")]
    property publish_all_ports : Bool?

    @[JSON::Field(key: "ReadonlyRootfs")]
    property readonly_rootfs : Bool?

    @[JSON::Field(key: "SecurityOpt")]
    property security_opt : Array(String)?

    @[JSON::Field(key: "StorageOpt")]
    property storage_opt : Hash(String, String)?

    @[JSON::Field(key: "UTSMode")]
    property uts_mode : String?

    @[JSON::Field(key: "UsernsMode")]
    property userns_mode : String?

    @[JSON::Field(key: "ShmSize")]
    property shm_size : UInt64?

    @[JSON::Field(key: "Sysctls")]
    property sysctls : Hash(String, String)?

    @[JSON::Field(key: "Runtime")]
    property runtime : String?

    @[JSON::Field(key: "ConsoleSize")]
    property console_size : Array(Int64)?

    @[JSON::Field(key: "Isolation")]
    property isolation : String?

    @[JSON::Field(key: "MaskedPaths")]
    property masked_paths : Array(String)?

    @[JSON::Field(key: "ReadonlyPaths")]
    property readonly_paths : Array(String)?

    def initialize(
      @binds = nil,
      @container_id_file = nil,
      @log_config = nil,
      @network_mode = nil,
      @port_bindings = nil,
      @restart_policy = nil,
      @auto_remove = nil,
      @volume_driver = nil,
      @volumes_from = nil,
      @mounts = nil,
      @cap_add = nil,
      @cap_drop = nil,
      @cgroupns_mode = nil,
      @dns = nil,
      @dns_options = nil,
      @dns_search = nil,
      @extra_hosts = nil,
      @group_add = nil,
      @ipc_mode = nil,
      @cgroup = nil,
      @links = nil,
      @oom_score_adj = nil,
      @pid_mode = nil,
      @privileged = nil,
      @publish_all_ports = nil,
      @readonly_rootfs = nil,
      @security_opt = nil,
      @storage_opt = nil,
      @uts_mode = nil,
      @userns_mode = nil,
      @shm_size = nil,
      @sysctls = nil,
      @runtime = nil,
      @console_size = nil,
      @isolation = nil,
      @masked_paths = nil,
      @readonly_paths = nil,
    )
    end
  end
end
