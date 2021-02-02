module Docr::API
  class Volumes
    getter client : Docr::Client

    def initialize(@client)
    end

    # List volumes
    def list : Docr::Models::VolumeListResponse
      @client.call("GET", "/volumes") do |response|
        body = response.body_io.gets_to_end
        return Docr::Models::VolumeListResponse.from_json(body)
      end
    end

    # Create a volume
    def create(config : Docr::Models::VolumeConfig) : Docr::Models::Volume
      headers = HTTP::Headers{"Content-Type" => "application/json"}
      payload = config.to_json

      @client.call("POST", "/volumes/create", headers, payload) do |response|
        body = response.body_io.gets_to_end
        return Docr::Models::Volume.from_json(body)
      end
    end

    # Inspect a volume
    def inspect(name : String) : Docr::Models::Volume
      @client.call("GET", "/volumes/#{name}") do |response|
        body = response.body_io.gets_to_end
        return Docr::Models::Volume.from_json(body)
      end
    end

    # Remove a volume
    def delete(name : String, force : Bool = false) : Bool
      @client.call("DELETE", "/volumes/#{name}") do
        return true
      end
    end
  end
end
