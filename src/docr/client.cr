# Require necessary modules and files.
require "http/client"
require "socket"

require "./errors"

# Define the Docr module.
module Docr
  # Define the Docr::Client class for making HTTP requests to the Docker API.
  class Client
    # Initializes a new instance of the Docr::Client class.
    def initialize
      # Create a UNIX socket connection to the Docker API.
      socket = UNIXSocket.new("/var/run/docker.sock")
      @client = HTTP::Client.new(socket)
    end

    # Makes an HTTP request to the Docker API.
    #
    # - method: The HTTP method (e.g., "GET", "POST", "PUT", "DELETE").
    # - url: The URL or URI for the API endpoint.
    # - headers: Optional HTTP headers.
    # - body: Optional request body (e.g., JSON payload).
    # - &block: A block to process the HTTP response.
    def call(method : String, url : String | URI, headers : HTTP::Headers | Nil = nil, body : IO | Slice(UInt8) | String | Nil = nil, &)
      @client.exec(method, url, headers, body) do |response|
        unless response.success?
          body = response.body_io?.try(&.gets_to_end) || "{\"message\": \"No response body\"}"
          error = Docr::Types::ErrorResponse.from_json(body)

          # Raise a custom DockerAPIError exception with the error message and status code.
          raise Docr::Errors::DockerAPIError.new(error.message, response.status_code)
        end

        # Yield the HTTP response to the provided block for further processing.
        yield response
      end
    end
  end
end
