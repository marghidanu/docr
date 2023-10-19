require "../client"

# The `Docr::Endpoints` module encompasses different endpoint handlers.
module Docr::Endpoints
  # The `Volumes` class provides methods to interact with volume-related endpoints.
  # This class uses the client to send requests to the server and handles responses.
  class Volumes
    # A client instance used for making requests.
    getter client : Docr::Client

    # Initializes a new `Volumes` instance with the provided client.
    def initialize(@client)
    end

    # Retrieves a list of volumes.
    #
    # Returns a response containing a list of volumes.
    def list : Docr::Types::VolumeListResponse
      @client.call("GET", "/volumes") do |response|
        body = response.body_io.gets_to_end
        return Docr::Types::VolumeListResponse.from_json(body)
      end
    end

    # Creates a new volume based on the provided configuration.
    #
    # - config: The configuration for creating the volume.
    #
    # Returns the created volume.
    def create(config : Docr::Types::VolumeConfig) : Docr::Types::Volume
      headers = HTTP::Headers{"Content-Type" => "application/json"}
      payload = config.to_json

      @client.call("POST", "/volumes/create", headers, payload) do |response|
        body = response.body_io.gets_to_end
        return Docr::Types::Volume.from_json(body)
      end
    end

    # Inspects a specific volume by its name.
    #
    # - name: The name of the volume to inspect.
    #
    # Returns details about the specified volume.
    def inspect(name : String) : Docr::Types::Volume
      @client.call("GET", "/volumes/#{name}") do |response|
        body = response.body_io.gets_to_end
        return Docr::Types::Volume.from_json(body)
      end
    end

    # Deletes a specific volume by its name.
    #
    # - name: The name of the volume to delete.
    # - force: (Optional) Force deletion if true. Default is false.
    #
    # Does not return any specific value.
    def delete(name : String, force : Bool = false)
      @client.call("DELETE", "/volumes/#{name}") do |response|
        response.consume_body_io
      end
    end
  end
end
