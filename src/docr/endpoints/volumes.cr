require "../client"

module Docr::Endpoints
  class Volumes
    getter client : Docr::Client

    def initialize(@client)
    end

    # List volumes
    def list : Docr::Types::VolumeListResponse
      @client.call("GET", "/volumes") do |response|
        body = response.body_io.gets_to_end
        return Docr::Types::VolumeListResponse.from_json(body)
      end
    end

    # Create a volume
    def create(config : Docr::Types::VolumeConfig) : Docr::Types::Volume
      headers = HTTP::Headers{"Content-Type" => "application/json"}
      payload = config.to_json

      @client.call("POST", "/volumes/create", headers, payload) do |response|
        body = response.body_io.gets_to_end
        return Docr::Types::Volume.from_json(body)
      end
    end

    # Inspect a volume
    def inspect(name : String) : Docr::Types::Volume
      @client.call("GET", "/volumes/#{name}") do |response|
        body = response.body_io.gets_to_end
        return Docr::Types::Volume.from_json(body)
      end
    end

    # Remove a volume
    def delete(name : String, force : Bool = false)
      @client.call("DELETE", "/volumes/#{name}") do |response|
        response.consume_body_io
      end
    end
  end
end
