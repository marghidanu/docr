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
      # pp params.to_s

      @client.call("GET", "/containers/json") do |response|
        body = response.body_io.gets_to_end
        return Array(Docr::Models::ContainerSummary).from_json(body)
      end
    end

    def create(name : String, config : Docr::Models::ContainerConfig)
      headers = HTTP::Headers{
        "Content-Type" => "application/json",
      }

      @client.call("POST", "/containers/create", headers, config.to_json) do |response|
        body = response.body_io.gets_to_end
        return nil
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
  end
end
