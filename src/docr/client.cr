require "http/client"

module Docr
  class Client
    def initialize
      socket = UNIXSocket.new("/var/run/docker.sock")
      @client = HTTP::Client.new(socket)
    end

    def call(method : String, url : String | URI, headers : HTTP::Headers | Nil = nil, body : IO | Slice(UInt8) | String | Nil = nil, &)
      @client.exec(method, url, headers, body) do |response|
        unless response.success?
          body = response.body_io.gets_to_end
          error = Docr::Types::ErrorResponse.from_json(body)

          raise DockerAPIError.new(error.message, response.status_code)
        end

        yield response
      end
    end
  end
end
