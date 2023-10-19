require "../client"

module Docr::Endpoints
  class Images
    getter client : Docr::Client

    def initialize(@client)
    end

    def list(all = false, filters = Hash(String, String).new, digests = false)
      @client.call("GET", "/images/json") do |response|
        body = response.body_io.gets_to_end
        return Array(Docr::Types::ImageSummary).from_json(body)
      end
    end

    # ameba:disable Metrics/CyclomaticComplexity
    def build(
      tags : Array(String),
      context : String = ".",
      dockerfile : String = "Dockerfile",
      extra_hosts : String? = nil,
      quiet : Bool = false,
      no_cache : Bool = false,
      cache_from : Array(String) = Array(String).new,
      pull : Bool = false,
      rm : Bool = true,
      forcerm : Bool = false,
      memory : Int32? = nil,
      memswap : Int32? = nil,
      cpu_shares : Int32? = nil,
      cpu_setcpus : String? = nil,
      cpu_period : Int32? = nil,
      cpu_quota : Int32? = nil,
      build_args : Hash(String, String)? = nil,
      shmsize : Int32? = nil,
      squash : Bool? = nil,
      labels : Hash(String, String)? = nil,
      network_mode : String? = nil,
      platform : String = "",
      target : String = "",
      outputs : String = "",
      &
    )
      params = URI::Params{
        "dockerfile" => dockerfile,
        "t"          => tags,
        "q"          => quiet.to_s,
        "nocache"    => no_cache.to_s,
        "cachefrom"  => cache_from.to_json,
        "pull"       => pull.to_s,
        "rm"         => rm.to_s,
        "forcerm"    => forcerm.to_s,
        "platform"   => platform,
        "target"     => target,
        "outputs"    => outputs,
      }

      params["extrahosts"] = extra_hosts if extra_hosts
      params["memory"] = memory.to_s if memory
      params["memswap"] = memswap.to_s if memswap
      params["cpushares"] = cpu_shares.to_s if cpu_shares
      params["cpusetcpus"] = cpu_setcpus if cpu_setcpus
      params["cpuperiod"] = cpu_period.to_s if cpu_period
      params["cpuquota"] = cpu_quota.to_s if cpu_quota
      params["buildargs"] = build_args.to_json if build_args
      params["shmsize"] = shmsize.to_s if shmsize
      params["squash"] = squash.to_s if squash
      params["labels"] = labels.to_json if labels
      params["networkmode"] = network_mode if network_mode

      headers = HTTP::Headers{
        "Content-Type" => "application/x-tar",
      }

      context = Docr::Utils.build_context(context)
      @client.call("POST", "/build?#{params}", headers, context) do |response|
        while line = response.body_io.gets
          json_data = JSON.parse(line.strip)

          if error = json_data["error"]?
            raise DockerBuildError.new(error.as_s)
          end

          if stream = json_data["stream"]?
            yield stream.as_s.strip
          end
        end
      end
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

    def inspect(name : String) : Docr::Types::Image
      @client.call("GET", "/images/#{name}/json") do |response|
        body = response.body_io.gets_to_end
        return Docr::Types::Image.from_json(body)
      end
    end

    def history(name : String) : Array(Docr::Types::HistoryResponseItem)
      @client.call("GET", "/images/#{name}/history") do |response|
        body = response.body_io.gets_to_end
        return Array(Docr::Types::HistoryResponseItem).from_json(body)
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

    def delete(name : String, force = false, no_prune = false) : Array(Docr::Types::ImageDeleteResponseItem)
      @client.call("DELETE", "/images/#{name}") do |response|
        body = response.body_io.gets_to_end
        return Array(Docr::Types::ImageDeleteResponseItem).from_json(body)
      end
    end
  end
end
