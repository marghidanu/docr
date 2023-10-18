require "../client"

module Docr::Endpoints
  class Networks
    getter client : Docr::Client

    def initialize(@client)
    end

    def list : Array(Docr::Types::Network)
      @client.call("GET", "/networks") do |response|
        body = response.body_io.gets_to_end
        return Array(Docr::Types::Network).from_json(body)
      end
    end

    def create(config : Docr::Types::NetworkConfig)
      headers = HTTP::Headers{"Content-Type" => "application/json"}
      payload = config.to_json

      @client.call("POST", "/networks/create", headers, payload) do |response|
        body = response.body_io.gets_to_end
        return Docr::Types::NetworkCreateResponse.from_json(body)
      end
    end

    def inspect(id : String, verbose : Bool = false, scope : String = "local") : Docr::Types::Network
      @client.call("GET", "/networks/#{id}") do |response|
        body = response.body_io.gets_to_end
        return Docr::Types::Network.from_json(body)
      end
    end

    def connect
      # TODO: Implement this
    end

    def disconnect
      # TODO: Implement this
    end

    def delete(id : String)
      @client.call("DELETE", "/networks/#{id}") do |response|
        response.consume_body_io
      end
    end
  end
end
