require "json"

module Docr::Types
  struct HistoryResponseItem
    include JSON::Serializable

    @[JSON::Field(key: "Id")]
    property id : String

    @[JSON::Field(key: "Created")]
    property created : Int64

    @[JSON::Field(key: "CreatedBy")]
    property created_by : String

    @[JSON::Field(key: "Tags")]
    property tags : Array(String)?

    @[JSON::Field(key: "Size")]
    property size : Int64

    @[JSON::Field(key: "Comment")]
    property comment : String
  end
end
