require "json"

module Docr::Types
  class ContainerInspectResponse
    include JSON::Serializable

    @[JSON::Field(key: "Id")]
    property id : String

    @[JSON::Field(key: "Created")]
    property created : String

    @[JSON::Field(key: "Path")]
    property path : String

    @[JSON::Field(key: "Args")]
    property args : Array(String)

    @[JSON::Field(key: "State")]
    property state : Docr::Types::ContainerState?

    @[JSON::Field(key: "Image")]
    property image : String

    @[JSON::Field(key: "ResolvConfPath")]
    property resolv_conf_path : String

    @[JSON::Field(key: "HostnamePath")]
    property hostname_path : String

    @[JSON::Field(key: "HostsPath")]
    property hosts_path : String

    @[JSON::Field(key: "LogPath")]
    property log_path : String

    @[JSON::Field(key: "Name")]
    property name : String

    @[JSON::Field(key: "RestartCount")]
    property restart_count : Int32

    @[JSON::Field(key: "Driver")]
    property driver : String

    @[JSON::Field(key: "Platform")]
    property platform : String

    @[JSON::Field(key: "MountLabel")]
    property mount_label : String

    @[JSON::Field(key: "ProcessLabel")]
    property process_label : String

    @[JSON::Field(key: "AppArmorProfile")]
    property app_armor_profile : String

    @[JSON::Field(key: "ExecIDs")]
    property exec_ids : Array(String)?

    @[JSON::Field(key: "HostConfig")]
    property host_config : Docr::Types::HostConfig

    @[JSON::Field(key: "GraphDriver")]
    property graph_driver : Docr::Types::GraphDriverData

    @[JSON::Field(key: "SizeRw")]
    property size_rw : Int64?

    @[JSON::Field(key: "SizeRootFs")]
    property size_root_fs : Int64?

    @[JSON::Field(key: "Mounts")]
    property mounts : Array(Docr::Types::MountPoint)

    @[JSON::Field(key: "Config")]
    property config : Docr::Types::ContainerConfig

    @[JSON::Field(key: "NetworkSettings")]
    property network_settings : Docr::Types::NetworkSettings
  end
end
