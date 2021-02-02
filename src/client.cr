require "json"
require "http/client"

require "./models/error_response"

module Docr
  class DockerAPIError < Exception
    getter status_code : Int32

    def initialize(message : String, @status_code : Int32)
      super "Code: #{@status_code} Message: #{message}"
    end
  end

  class Client
    def initialize
      socket = UNIXSocket.new("/var/run/docker.sock")
      @client = HTTP::Client.new(socket)
    end

    def call(*params)
      @client.exec(*params) do |response|
        unless response.success?
          body = response.body_io.gets_to_end
          error = Docr::Models::ErrorResponse.from_json(body)

          raise DockerAPIError.new(error.message, response.status_code)
        end

        yield response
      end
    end
  end
end
