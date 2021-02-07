require "json"

module Docr::Types
  struct RestartPolicy
    include JSON::Serializable

    @[JSON::Field(key: "Name")]
    property name : String

    @[JSON::Field(key: "MaximumRetryCount")]
    property maximum_retry_count : Int64
  end
end
