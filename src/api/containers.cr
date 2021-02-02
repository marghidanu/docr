require "../models/*"

module Docr::API
  class Containers
    getter client : Docr::Client

    def initialize(@client)
    end

    def list(all : Bool = false, limit : Int32? = nil, size : Bool = false, filters = Hash(String, Array(String)).new)
      # params = URI::Params{
      #   "all"     => [all.to_s],
      #   "limit"   => [limit.to_s],
      #   "size"    => [size.to_s],
      #   "filters" => [filters.to_json],
      # }

      @client.call("GET", "/containers/json") do |response|
        body = response.body_io.gets_to_end
        return Array(Docr::Models::ContainerSummary).from_json(body)
      end
    end

    def create(name : String, config : Docr::Models::ContainerConfig)
      params = URI::Params{
        "name" => [name],
      }

      headers = HTTP::Headers{
        "Content-Type" => "application/json",
      }
      payload = config.to_json

      @client.call("POST", "/containers/create?#{params}", headers, payload) do |response|
        body = response.body_io.gets_to_end
        return Docr::Models::ContainerCreateResponse.from_json(body)
      end
    end

    def inspect(id : String)
      @client.call("GET", "/containers/#{id}/json") do |response|
        body = response.body_io.gets_to_end
        return Docr::Models::ContainerInspectResponse.from_json(body)
      end
    end

    def top(id : String)
      @client.call("GET", "/containers/#{id}/top") do |response|
        body = response.body_io.gets_to_end
        return Docr::Models::ContainerTopResponse.from_json(body)
      end
    end

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
