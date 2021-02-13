require "json"
require "http/client"

require "./types/error_response"
require "./endpoints/*"

module Docr
  VERSION = "0.1.0"

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
          error = Docr::Types::ErrorResponse.from_json(body)

          raise DockerAPIError.new(error.message, response.status_code)
        end

        yield response
      end
    end
  end

  class API
    getter client : Docr::Client

    getter images : Docr::Endpoints::Images
    getter containers : Docr::Endpoints::Containers
    getter networks : Docr::Endpoints::Networks
    getter volumes : Docr::Endpoints::Volumes
    getter sys : Docr::Endpoints::System
    getter exec : Docr::Endpoints::Exec

    def initialize(@client)
      @images = Docr::Endpoints::Images.new(client)
      @containers = Docr::Endpoints::Containers.new(client)
      @networks = Docr::Endpoints::Networks.new(client)
      @volumes = Docr::Endpoints::Volumes.new(client)
      @sys = Docr::Endpoints::System.new(client)
      @exec = Docr::Endpoints::Exec.new(client)
    end
  end

  class Utils
    def self.parse_repository_tag(name : String)
      if name.includes?('@')
        data = name.rpartition('@')
        return {data[0], data[2]}
      end

      repository, tag = name, ""
      if name.includes?(':')
        data = name.rpartition(':')
        repository, tag = data[0], data[2]

        repository, tag = name, "" if tag.includes?('/')
      end

      return {repository, tag}
    end
  end
end
