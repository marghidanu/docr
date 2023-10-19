require "../client"

module Docr::Endpoints
  # The `Exec` class provides functionality related to executing commands within containers.
  class Exec
    # Returns the associated client instance.
    getter client : Docr::Client

    # Initializes the `Exec` endpoint with a specific client instance.
    #
    # - client: The client instance used for making API calls.
    def initialize(@client)
    end

    # Inspects details about a specific exec instance.
    #
    # - id: The ID of the exec instance to inspect.
    #
    # Returns a structured response after inspecting the exec instance.
    def inspect(id : String)
      @client.call("GET", "/exec/#{id}/json") do |response|
        body = response.body_io.gets_to_end
        return Docr::Types::ExecInspectResponse.from_json(body)
      end
    end

    # Starts an exec command with a given configuration.
    #
    # - id: The ID of the exec instance to start.
    # - config: Configuration details for starting the exec command.
    #
    # Returns the IO stream of the started command.
    def start(id : String, config : Docr::Types::ExecStartConfig) : IO
      headers = HTTP::Headers{
        "Content-Type" => "application/json",
      }

      payload = config.to_json

      @client.call("POST", "/exec/#{id}/start", headers, payload) do |response|
        return response.body_io
      end
    end

    # Creates an exec instance for a container with a given configuration.
    #
    # - id: The ID of the container to create the exec instance for.
    # - config: Configuration details for creating the exec instance.
    #
    # Returns the ID of the created exec instance.
    def container(id : String, config : Docr::Types::ExecConfig) : Docr::Types::IdResponseIdResponse
      headers = HTTP::Headers{
        "Content-Type" => "application/json",
      }

      payload = config.to_json

      @client.call("POST", "/containers/#{id}/exec", headers, payload) do |response|
        body = response.body_io.gets_to_end
        return Docr::Types::IdResponseIdResponse.from_json(body)
      end
    end
  end
end
