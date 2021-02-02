module Docr::API
  class System
    getter client : Docr::Client

    def initialize(@client)
    end

    # Validate credentials for a registry and, if available, get an identity token for accessing the registry without password.
    def auth(auth : Docr::Models::AuthConfig) : Docr::Models::SystemAuthResponse
      headers = HTTP::Headers{"Content-Type" => "application/json"}
      payload = auth.to_json

      @client.call("POST", "/auth", headers, payload) do |response|
        body = response.body_io.gets_to_end
        return Docr::Models::SystemAuthResponse.from_json(body)
      end
    end

    # Get system information
    def info
      @client.call("GET", "/info") do |response|
        body = response.body_io.gets_to_end
        return nil
      end
    end

    # Returns the version of Docker that is running and various information about the system that Docker is running on.
    def version : Docr::Models::SystemVersion
      @client.call("GET", "/version") do |response|
        body = response.body_io.gets_to_end
        return Docr::Models::SystemVersion.from_json(body)
      end
    end

    # This is a dummy endpoint you can use to test if the server is accessible.
    def ping : String
      @client.call("GET", "/_ping") do |response|
        body = response.body_io.gets_to_end
        return body
      end
    end

    def events(since : Time? = nil, _until : Time? = nil, filters = Hash(String, Array(String)).new) : IO
      # TODO: Add query params to request

      @client.call("GET", "/events") do |response|
        return response.body_io
      end
    end
  end
end
