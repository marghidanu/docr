require "../client"

# The `Docr::Endpoints` module encompasses different endpoint handlers.
module Docr::Endpoints
  # The `Networks` class provides methods to interact with network-related endpoints.
  # This class uses the client to send requests to the server and handles the responses.
  class Networks
    # A client instance used for making requests.
    getter client : Docr::Client

    # Initializes a new `Networks` instance with the provided client.
    def initialize(@client)
    end

    # Retrieves a list of all networks.
    #
    # Returns an array of network objects.
    def list : Array(Docr::Types::Network)
      @client.call("GET", "/networks") do |response|
        body = response.body_io.gets_to_end
        return Array(Docr::Types::Network).from_json(body)
      end
    end

    # Creates a new network using the given configuration.
    #
    # - config: Configuration for creating the network.
    #
    # Returns the created network.
    def create(config : Docr::Types::NetworkConfig)
      headers = HTTP::Headers{"Content-Type" => "application/json"}
      payload = config.to_json

      @client.call("POST", "/networks/create", headers, payload) do |response|
        body = response.body_io.gets_to_end
        return Docr::Types::NetworkCreateResponse.from_json(body)
      end
    end

    # Inspects a specific network using its ID.
    # Additional optional parameters can be used to adjust the verbosity and scope of the inspection.
    #
    # - id: ID of the network to inspect.
    # - verbose: If true, provides detailed information. Default is false.
    # - scope: Specifies the scope of the inspection. Default is "local".
    #
    # Returns details about the network.
    def inspect(id : String, verbose : Bool = false, scope : String = "local") : Docr::Types::Network
      @client.call("GET", "/networks/#{id}") do |response|
        body = response.body_io.gets_to_end
        return Docr::Types::Network.from_json(body)
      end
    end

    # Connects a given container to a network.
    # (Implementation is currently pending.)
    def connect
      # TODO: Implement this
    end

    # Disconnects a given container from a network.
    # (Implementation is currently pending.)
    def disconnect
      # TODO: Implement this
    end

    # Deletes a specific network using its ID.
    #
    # - id: ID of the network to delete.
    #
    # Deletes the network.
    def delete(id : String)
      @client.call("DELETE", "/networks/#{id}") do |response|
        response.consume_body_io
      end
    end
  end
end
