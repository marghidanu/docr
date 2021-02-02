module Docr::API
  class Images
    getter client : Docr::Client

    def initialize(@client)
    end

    def list(all = false, filters = Hash(String, String).new, digests = false)
      @client.call("GET", "/images/json") do |response|
        body = response.body_io.gets_to_end
        return Array(Docr::Models::ImageSummary).from_json(body)
      end
    end

    def build
      # TODO: Implement this!
    end

    def create(image : String, tag : String = "latest")
      params = URI::Params{
        "fromImage" => [image],
        "tag"       => [tag],
      }

      @client.call("POST", "/images/create?#{params}") do |response|
        response.consume_body_io
      end
    end

    def inspect(name : String) : Docr::Models::Image
      @client.call("GET", "/images/#{name}/json") do |response|
        body = response.body_io.gets_to_end
        return Docr::Models::Image.from_json(body)
      end
    end

    def history(name : String) : Array(Docr::Models::HistoryResponseItem)
      @client.call("GET", "/images/#{name}/history") do |response|
        body = response.body_io.gets_to_end
        return Array(Docr::Models::HistoryResponseItem).from_json(body)
      end
    end

    def push(name : String, tag : String, auth : String)
      # headers = HTTP::Headers {}

      @client.call("POST", "/images/#{name}/push") do
        response.consume_body_io
      end
    end

    def tag(name : String, repo : String, tag : String)
      params = URI::Params{
        "repo" => [repo],
        "tag"  => [tag],
      }

      @client.call("POST", "/images/#{name}/tag?#{params}") do |response|
        response.consume_body_io
      end
    end

    def delete(name : String, force = false, no_prune = false) : Array(Docr::Models::ImageDeleteResponseItem)
      @client.call("DELETE", "/images/#{name}") do |response|
        body = response.body_io.gets_to_end
        return Array(Docr::Models::ImageDeleteResponseItem).from_json(body)
      end
    end
  end
end
