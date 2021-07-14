require "json"

module Docr::Types
  class RestartPolicy
    include JSON::Serializable

    @[JSON::Field(key: "Name")]
    property name : String

    @[JSON::Field(key: "MaximumRetryCount")]
    property maximum_retry_count : Int64?

    def initialize(@name = "", @maximum_retry_count = nil)
    end
  end
end
