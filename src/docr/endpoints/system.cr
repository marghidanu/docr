require "../client"

# The `Docr::Endpoints` module encompasses different endpoint handlers.
module Docr::Endpoints
  # The `System` class provides methods to interact with system-related endpoints.
  # This class uses the client to send requests to the server and handles the responses.
  class System
    # A client instance used for making requests.
    getter client : Docr::Client

    # Initializes a new `System` instance with the provided client.
    def initialize(@client)
    end

    # Authenticates against a registry, optionally retrieving an identity token for further password-less access.
    #
    # - auth: The authentication configuration.
    #
    # Returns authentication details, including an identity token if available.
    def auth(auth : Docr::Types::AuthConfig) : Docr::Types::SystemAuthResponse
      headers = HTTP::Headers{"Content-Type" => "application/json"}
      payload = auth.to_json

      @client.call("POST", "/auth", headers, payload) do |response|
        body = response.body_io.gets_to_end
        return Docr::Types::SystemAuthResponse.from_json(body)
      end
    end

    # Fetches system information.
    #
    # Returns system information as a response object.
    def info
      @client.call("GET", "/info") do |response|
        _ = response.body_io.gets_to_end
        return nil
      end
    end

    # Retrieves the Docker version and various details about the system Docker runs on.
    #
    # Returns a structured response with Docker version information.
    def version : Docr::Types::SystemVersion
      @client.call("GET", "/version") do |response|
        body = response.body_io.gets_to_end
        return Docr::Types::SystemVersion.from_json(body)
      end
    end

    # Checks the server's accessibility.
    #
    # Returns a simple response string indicating server accessibility.
    def ping : String
      @client.call("GET", "/_ping") do |response|
        body = response.body_io.gets_to_end
        return body
      end
    end

    # Fetches system events, optionally filtering by time and specific event attributes.
    #
    # - since: A timestamp to filter events since. Default is nil.
    # - _until: A timestamp to filter events until. Default is nil.
    # - filters: Additional filters for event attributes. Default is an empty hash.
    #
    # Returns an IO object that can be used to read system events.
    def events(since : Time? = nil, _until : Time? = nil, filters = Hash(String, Array(String)).new) : IO
      # TODO: Implement query parameters to filter the request.
      @client.call("GET", "/events") do |response|
        return response.body_io
      end
    end
  end
end
