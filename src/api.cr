require "./endpoints/*"

module Docr
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
end
