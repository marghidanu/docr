require "json"

module Docr::Types
  struct Actor
    include JSON::Serializable

    # The ID of the object emitting the event
    @[JSON::Field(key: "ID")]
    property id : String

    # Various key/value attributes of the object, depending on its type
    @[JSON::Field(key: "Attributes")]
    property attributes : Hash(String, String)
  end

  struct SystemEventsResponse
    include JSON::Serializable

    # The type of object emitting the event
    @[JSON::Field(key: "Type")]
    property type : String

    # The type of event
    @[JSON::Field(key: "Action")]
    property action : String

    @[JSON::Field(key: "Actor")]
    property actor : Actor

    # Timestamp of event
    @[JSON::Field(key: "time")]
    property time : Int32

    # Timestamp of event, with nanosecond accuracy
    @[JSON::Field(key: "timeNano")]
    property time_nano : Int64
  end
end
