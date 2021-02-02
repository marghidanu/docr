module Docr::API
  class Networks
    getter client : Docr::Client

    def initialize(@client)
    end

    def list : Array(Docr::Models::Network)
      @client.call("GET", "/networks") do |response|
        body = response.body_io.gets_to_end
        return Array(Docr::Models::Network).from_json(body)
      end
    end

    def create(config : Docr::Models::NetworkConfig)
      headers = HTTP::Headers{"Content-Type" => "application/json"}
      payload = config.to_json

      @client.call("POST", "/networks/create", headers, payload) do |response|
        body = response.body_io.gets_to_end
        return Docr::Models::NetworkCreateResponse.from_json(body)
      end
    end

    def inspect(id : String, verbose : Bool = false, scope : String = "local") : Docr::Models::Network
      @client.call("GET", "/networks/#{id}") do |response|
        body = response.body_io.gets_to_end
        return Docr::Models::Network.from_json(body)
      end
    end

    def connect
      # TODO: Implement this
    end

    def disconnect
      # TODO: Implement this
    end

    def delete(id : String) : Bool
      @client.call("DELETE", "/networks/#{id}") do
        return true
      end
    end
  end
end
