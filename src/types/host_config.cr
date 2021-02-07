require "json"

module Docr::Types
  struct LogConfig
    include JSON::Serializable

    @[JSON::Field(key: "Type")]
    property type : String
    @[JSON::Field(key: "Config")]
    property config : Hash(String, String)
  end

  struct HostConfig
    include JSON::Serializable

    #   - $ref: "#/definitions/Resources"

    @[JSON::Field(key: "Binds")]
    property binds : Array(String)?

    @[JSON::Field(key: "ContainerIDFile")]
    property container_id_file : String

    @[JSON::Field(key: "LogConfig")]
    property log_config : Docr::Types::LogConfig

    @[JSON::Field(key: "NetworkMode")]
    property network_mode : String

    @[JSON::Field(key: "PortBindings")]
    property port_bindings : Hash(String, Docr::Types::PortBinding)?

    @[JSON::Field(key: "RestartPolicy")]
    property restart_policy : Docr::Types::RestartPolicy

    @[JSON::Field(key: "AutoRemove")]
    property auto_remove : Bool

    @[JSON::Field(key: "VolumeDriver")]
    property volume_driver : String

    @[JSON::Field(key: "VolumesFrom")]
    property volumes_from : Array(String)?

    @[JSON::Field(key: "Mounts")]
    property mounts : Array(Docr::Types::Mount)?

    @[JSON::Field(key: "CapAdd")]
    property cap_add : Array(String)?

    @[JSON::Field(key: "CapDrop")]
    property cap_drop : Array(String)?

    @[JSON::Field(key: "CgroupnsMode")]
    property cgroupns_mode : String

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
    property ipc_mode : String

    @[JSON::Field(key: "Cgroup")]
    property cgroup : String

    @[JSON::Field(key: "Links")]
    property links : Array(String)?

    @[JSON::Field(key: "OomScoreAdj")]
    property oom_score_adj : Int64?

    @[JSON::Field(key: "PidMode")]
    property pid_mode : String

    @[JSON::Field(key: "Privileged")]
    property privileged : Bool

    @[JSON::Field(key: "PublishAllPorts")]
    property publish_all_ports : Bool

    @[JSON::Field(key: "ReadonlyRootfs")]
    property readonly_rootfs : Bool

    @[JSON::Field(key: "SecurityOpt")]
    property security_opt : Array(String)?

    @[JSON::Field(key: "StorageOpt")]
    property storage_opt : Hash(String, String)?

    @[JSON::Field(key: "UTSMode")]
    property uts_mode : String

    @[JSON::Field(key: "UsernsMode")]
    property userns_mode : String

    @[JSON::Field(key: "ShmSize")]
    property shm_size : UInt64

    @[JSON::Field(key: "Sysctls")]
    property sysctls : Hash(String, String)?

    @[JSON::Field(key: "Runtime")]
    property runtime : String

    @[JSON::Field(key: "ConsoleSize")]
    property console_size : Array(Int64)

    @[JSON::Field(key: "Isolation")]
    property isolation : String

    @[JSON::Field(key: "MaskedPaths")]
    property masked_paths : Array(String)

    @[JSON::Field(key: "ReadonlyPaths")]
    property readonly_paths : Array(String)
  end
end
