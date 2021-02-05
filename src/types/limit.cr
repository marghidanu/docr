require "json"

module Docr::Types
  struct Limit
    include JSON::Serializable

    @[JSON::Field(key: "NanoCPUs")]
    property nano_cp_us : Int64?

    @[JSON::Field(key: "MemoryBytes")]
    property memory_bytes : Int64?

    @[JSON::Field(key: "Pids")]
    property pids : Int64

    def initialize(
      @nano_cp_us = nil,
      @memory_bytes = nil,
      @pids = 0
    )
    end
  end
end
