require "json"

require "./docr/client"
require "./docr/endpoints/*"
require "./docr/types/error_response"
require "./docr/utils"

module Docr
  VERSION = "0.1.1"

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

  class DockerAPIError < Exception
    getter status_code : Int32

    def initialize(message : String, @status_code : Int32)
      super "Code: #{@status_code} Message: #{message}"
    end
  end

  class DockerBuildError < Exception
    def initialize(message : String?)
      super "Docker Build Error: ${@message}"
    end
  end
end
