require "json"

module Docr::Types
  struct ComponentVersion
    include JSON::Serializable

    # Name of the component
    @[JSON::Field(key: "Name")]
    property name : String

    # Version of the component
    @[JSON::Field(key: "Version")]
    property version : String

    # Key/value pairs of strings with additional information about the component.
    @[JSON::Field(key: "Details")]
    property details : Hash(String, String)?
  end

  struct SystemVersion
    include JSON::Serializable
    # The version of the daemon
    @[JSON::Field(key: "Version")]
    property version : String

    @[JSON::Field(key: "Platform")]
    property platform : Hash(String, String)

    # Information about system components
    @[JSON::Field(key: "Components")]
    property components : Array(ComponentVersion)

    # The default (and highest) API version that is supported by the daemon
    @[JSON::Field(key: "ApiVersion")]
    property api_version : String

    # The minimum API version that is supported by the daemon
    @[JSON::Field(key: "MinAPIVersion")]
    property min_api_version : String

    # The Git commit of the source code that was used to build the daemon
    @[JSON::Field(key: "GitCommit")]
    property git_commit : String

    # The version Go used to compile the daemon, and the version of the Go runtime in use.
    @[JSON::Field(key: "GoVersion")]
    property go_version : String

    # The operating system that the daemon is running on ("linux" or "windows")
    @[JSON::Field(key: "Os")]
    property os : String

    # The architecture that the daemon is running on
    @[JSON::Field(key: "Arch")]
    property arch : String

    # The kernel version (`uname -r`) that the daemon is running on.
    @[JSON::Field(key: "KernelVersion")]
    property kernel_version : String

    # Indicates if the daemon is started with experimental features enabled.
    @[JSON::Field(key: "Experimental")]
    property experimental : Bool?

    # The date and time that the daemon was compiled.
    @[JSON::Field(key: "BuildTime")]
    property build_time : String
  end
end
