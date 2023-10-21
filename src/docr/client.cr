# Require necessary modules and files.
require "http/client"
require "socket"

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
        if !response.success?
          body = response.body_io.gets_to_end
          error = Docr::Types::ErrorResponse.from_json(body)

          # Raise a custom APIException exception with the error message and status code.
          raise Docr::APIException.new(error.message, response.status_code)
        end

        # Yield the HTTP response to the provided block for further processing.
        yield response
      end
    end
  end
end
