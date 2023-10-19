require "./client"
require "./endpoints/*"

module Docr
  # Docr API client for interacting with Docker-related endpoints.
  #
  # - client: The client instance to use for making API requests.
  #
  # Provides access to various endpoint handlers such as images, containers, networks, volumes, system, and exec.
  # Also includes custom exceptions for handling Docker API errors.
  class API
    # The client instance used for making API requests.
    getter client : Docr::Client

    # Provides access to Docker image-related endpoints.
    getter images : Docr::Endpoints::Images

    # Provides access to Docker container-related endpoints.
    getter containers : Docr::Endpoints::Containers

    # Provides access to Docker network-related endpoints.
    getter networks : Docr::Endpoints::Networks

    # Provides access to Docker volume-related endpoints.
    getter volumes : Docr::Endpoints::Volumes

    # Provides access to Docker system-related endpoints.
    getter sys : Docr::Endpoints::System

    # Provides access to Docker exec-related endpoints.
    getter exec : Docr::Endpoints::Exec

    # Initializes a new instance of the Docr API client.
    #
    # - client: The client instance to use for making API requests.

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
