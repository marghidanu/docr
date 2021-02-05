module Docr::Endpoints
  class Exec
    getter client : Docr::Client

    def initialize(@client)
    end

    def inspect(id : String)
      @client.call("GET", "/exec/#{id}/json") do |response|
        body = response.body_io.gets_to_end
        return Docr::Types::ExecInspectResponse.from_json(body)
      end
    end

    def start(id : String, config : Docr::Types::ExecStartConfig) : IO
      headers = HTTP::Headers{
        "Content-Type" => "application/json",
      }

      payload = config.to_json

      @client.call("POST", "/exec/#{id}/start", headers, payload) do |response|
        return response.body_io
      end
    end

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
