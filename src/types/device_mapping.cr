require "json"

module Docr::Types
  struct DeviceMapping
    include JSON::Serializable

    @[JSON::Field(key: "PathOnHost")]
    property path_on_host : String

    @[JSON::Field(key: "PathInContainer")]
    property path_in_container : String

    @[JSON::Field(key: "CgroupPermissions")]
    property cgroup_permissions : String
  end
end
