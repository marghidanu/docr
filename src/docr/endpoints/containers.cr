require "../client"
require "../types/*"

# A module for Docr related operations.
module Docr::Endpoints
  # Class responsible for handling container operations in the Docr system.
  class Containers
    getter client : Docr::Client

    # Initializes a new Containers instance with the provided client.
    def initialize(@client)
    end

    # Fetches a list of containers.
    #
    # - all: If true, list all containers. Default is false.
    # - limit: The maximum number of containers to list.
    # - size: If true, fetch container sizes. Default is false.
    # - filters: Container filter criteria. Default is an empty hash.
    #
    # Returns an array of container summaries.
    def list(all : Bool = false, limit : Int32? = nil, size : Bool = false, filters = Hash(String, Array(String)).new) : Array(Docr::Types::ContainerSummary)
      params = URI::Params{
        "all"     => [all.to_s],
        "limit"   => [limit.to_s],
        "size"    => [size.to_s],
        "filters" => [filters.to_json],
      }

      @client.call("GET", "/containers/json?#{params}") do |response|
        body = response.body_io.gets_to_end
        return Array(Docr::Types::ContainerSummary).from_json(body)
      end
    end

    # Creates a new container.
    #
    # - name: Name of the container.
    # - config: Configuration for creating the container.
    #
    # Returns a response containing information about the created container.
    def create(name : String, config : Docr::Types::CreateContainerConfig) : Docr::Types::ContainerCreateResponse
      params = URI::Params{
        "name" => [name],
      }

      headers = HTTP::Headers{
        "Content-Type" => "application/json",
      }

      payload = config.to_json

      @client.call("POST", "/containers/create?#{params}", headers, payload) do |response|
        body = response.body_io.gets_to_end
        return Docr::Types::ContainerCreateResponse.from_json(body)
      end
    end

    # Fetches the changes made to the container.
    #
    # - id: ID of the container.
    #
    # Returns an array of container change items.
    def changes(id : String) : Array(Docr::Types::ContainerChangeResponseItem)
      @client.call("GET", "/containers/#{id}/changes") do |response|
        body = response.body_io.gets_to_end
        return Array(Docr::Types::ContainerChangeResponseItem).from_json(body)
      end
    end

    # Inspects a specific container.
    #
    # - id: ID of the container to inspect.
    #
    # Returns detailed information about the container.
    def inspect(id : String) : Docr::Types::ContainerInspectResponse
      @client.call("GET", "/containers/#{id}/json") do |response|
        body = response.body_io.gets_to_end
        return Docr::Types::ContainerInspectResponse.from_json(body)
      end
    end

    # Starts a specific container.
    #
    # - id: ID of the container to start.
    def start(id : String)
      @client.call("POST", "/containers/#{id}/start") do |response|
        response.consume_body_io
      end
    end

    # Stops a specific container.
    #
    # - id: ID of the container to stop.
    def stop(id : String)
      @client.call("POST", "/containers/#{id}/stop") do |response|
        response.consume_body_io
      end
    end

    # Restarts a specific container.
    #
    # - id: ID of the container to restart.
    def restart(id : String)
      @client.call("POST", "/containers/#{id}/restart") do |response|
        response.consume_body_io
      end
    end

    # Pauses a specific container.
    #
    # - id: ID of the container to pause.
    def pause(id : String)
      @client.call("POST", "/containers/#{id}/pause") do |response|
        response.consume_body_io
      end
    end

    # Unpauses a specific container.
    #
    # - id: ID of the container to unpause.
    def unpause(id : String)
      @client.call("POST", "/containers/#{id}/unpause") do |response|
        response.consume_body_io
      end
    end

    # Fetches logs of a specific container.
    #
    # - id: ID of the container.
    # - follow: If true, follow logs. Default is false.
    # - stdout: If true, fetch stdout logs. Default is false.
    # - stderr: If true, fetch stderr logs. Default is false.
    # - since: Timestamp to start showing logs. Default is 0.
    # - until: Timestamp to stop showing logs. Default is 0.
    # - timestamps: If true, include timestamps. Default is false.
    # - tail: Number of lines to show from the end of the logs. Default is "all".
    #
    # Returns the IO stream of the logs.
    def logs(id : String, follow = false, stdout = false, stderr = false, since = 0, _until = 0, timestamps = false, tail = "all")
      params = URI::Params{
        "follow"     => [follow.to_s],
        "stdout"     => [stdout.to_s],
        "stderr"     => [stderr.to_s],
        "since"      => [since.to_s],
        "until"      => [_until.to_s],
        "timestamps" => [timestamps.to_s],
        "tail"       => [tail],
      }

      @client.call("GET", "/containers/#{id}/logs?#{params}") do |response|
        return response.body_io
      end
    end

    # Attach to a container
    #
    # - id: ID of the container to attach to.
    def attach(id : String)
      params = URI::Params{
        "stream" => ["1"],
        "logs"   => ["1"],
      }

      @client.call("POST", "/containers/#{id}/attach?#{params}") do |response|
        return response.body_io
      end
    end

    # Kills a specific container.
    #
    # - id: ID of the container to kill.
    # - signal: Signal to use for killing. Default is "SIGKILL".
    def kill(id : String, signal = "SIGKILL")
      @client.call("POST", "/containers/#{id}/kill") do |response|
        response.consume_body_io
      end
    end

    # Fetches process details within a specific container.
    #
    # - id: ID of the container.
    # - ps_args: Arguments for the ps command. Default is "-ef".
    #
    # Returns process details within the container.
    def top(id : String, ps_args = "-ef") : Docr::Types::ContainerTopResponse
      params = URI::Params{
        "ps_args" => [ps_args],
      }

      @client.call("GET", "/containers/#{id}/top?#{params}") do |response|
        body = response.body_io.gets_to_end
        return Docr::Types::ContainerTopResponse.from_json(body)
      end
    end

    # Waits for a container to reach a specific condition.
    #
    # - id: ID of the container to wait for.
    # - condition: Wait condition. Default is "not-running".
    #
    # Returns information about the waited container.
    def wait(id : String, condition = "not-running") : Docr::Types::ContainerWaitResponse
      params = URI::Params{
        "condition" => [condition],
      }

      @client.call("POST", "/containers/#{id}/wait?#{params}") do |response|
        body = response.body_io.gets_to_end
        return Docr::Types::ContainerWaitResponse.from_json(body)
      end
    end

    # Deletes a specific container.
    #
    # - id: ID of the container to delete.
    # - volumes: If true, remove associated volumes. Default is false.
    # - force: If true, force deletion. Default is false.
    # - link: If true, remove the link. Default is false.
    def delete(id : String, volumes = false, force = false, link = false)
      params = URI::Params{
        "v"     => [volumes.to_s],
        "force" => [force.to_s],
        "link"  => [link.to_s],
      }

      @client.call("DELETE", "/containers/#{id}?#{params}") do |response|
        response.consume_body_io
      end
    end
  end
end
