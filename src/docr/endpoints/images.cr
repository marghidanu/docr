require "../client"

module Docr::Endpoints
  class Images
    getter client : Docr::Client

    def initialize(@client)
    end

    # Retrieves a list of images.
    #
    # - all: (Optional) List all images if true, else only top-level images. Default is false.
    # - filters: (Optional) Filters to apply to the image list. Default is an empty hash.
    # - digests: (Optional) Include image digests if true. Default is false.
    #
    # Returns an array of image summaries.
    def list(all = false, filters = Hash(String, String).new, digests = false)
      @client.call("GET", "/images/json") do |response|
        body = response.body_io.gets_to_end
        return Array(Docr::Types::ImageSummary).from_json(body)
      end
    end

    # Builds a Docker image using the specified parameters.
    #
    # - tags: An array of tags to assign to the built image.
    # - context: (Optional) The build context directory. Default is the current directory.
    # - dockerfile: (Optional) The path to the Dockerfile within the build context. Default is "Dockerfile".
    # - extra_hosts: (Optional) Additional hostnames to add to the container's /etc/hosts file.
    # - quiet: (Optional) Set to true to suppress build output. Default is false.
    # - no_cache: (Optional) Set to true to skip the build cache. Default is false.
    # - cache_from: (Optional) An array of images from which to cache build stages.
    # - pull: (Optional) Set to true to force pulling base images. Default is false.
    # - rm: (Optional) Set to true to remove intermediate containers after a successful build. Default is true.
    # - forcerm: (Optional) Set to true to always remove intermediate containers, even upon failure. Default is false.
    # - memory: (Optional) The maximum amount of memory the build process can use.
    # - memswap: (Optional) Total memory (including swap). Set to -1 to disable swap.
    # - cpu_shares: (Optional) CPU shares for the build process.
    # - cpu_setcpus: (Optional) CPUs in which to allow execution.
    # - cpu_period: (Optional) CPU CFS (Completely Fair Scheduler) period.
    # - cpu_quota: (Optional) CPU CFS quota.
    # - build_args: (Optional) Additional build arguments as a hash.
    # - shmsize: (Optional) Size of /dev/shm in bytes.
    # - squash: (Optional) Set to true to squash layers into a single layer. Default is false.
    # - labels: (Optional) Labels to apply to the image as a hash.
    # - network_mode: (Optional) Network mode for the build.
    # - platform: (Optional) Platform for which to build the image.
    # - target: (Optional) Build stage to build until.
    # - outputs: (Optional) Build outputs configuration.
    # - &block: A block to capture and process build output messages.
    #
    # Raises a DockerBuildError if the build process encounters an error.
    #
    # Does not return any specific value.
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
      version : String = "1",
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
        "version"    => version,
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
            raise Docr::Errors::DockerBuildError.new(error.as_s)
          end

          if stream = json_data["stream"]?
            yield stream.as_s.strip
          end
        end
      end
    end

    # Creates a new image by pulling it from a registry.
    #
    # - image: The name of the image to create.
    # - tag: (Optional) The tag of the image. Default is "latest".
    #
    # Does not return any specific value.
    def create(image : String, tag : String = "latest")
      params = URI::Params{
        "fromImage" => [image],
        "tag"       => [tag],
      }

      @client.call("POST", "/images/create?#{params}") do |response|
        response.consume_body_io
      end
    end

    # Inspects a specific image by its name.
    #
    # - name: The name of the image to inspect.
    #
    # Returns details about the specified image.
    def inspect(name : String) : Docr::Types::Image
      @client.call("GET", "/images/#{name}/json") do |response|
        body = response.body_io.gets_to_end
        return Docr::Types::Image.from_json(body)
      end
    end

    # Fetches the history of a specific image by its name.
    #
    # - name: The name of the image to fetch history for.
    #
    # Returns an array of image history response items.
    def history(name : String) : Array(Docr::Types::HistoryResponseItem)
      @client.call("GET", "/images/#{name}/history") do |response|
        body = response.body_io.gets_to_end
        return Array(Docr::Types::HistoryResponseItem).from_json(body)
      end
    end

    # Pushes an image to a registry.
    #
    # - name: The name of the image to push.
    # - tag: The tag of the image to push.
    # - auth: Authentication credentials for pushing the image.
    #
    # Does not return any specific value.
    def push(name : String, tag : String, auth : String)
      # headers = HTTP::Headers {}

      @client.call("POST", "/images/#{name}/push") do
        response.consume_body_io
      end
    end

    # Tags an image into a repository.
    #
    # - name: The name of the image to tag.
    # - repo: The repository name to tag the image into.
    # - tag: The tag to apply to the image.
    #
    # Does not return any specific value.
    def tag(name : String, repo : String, tag : String)
      params = URI::Params{
        "repo" => [repo],
        "tag"  => [tag],
      }

      @client.call("POST", "/images/#{name}/tag?#{params}") do |response|
        response.consume_body_io
      end
    end

    # Deletes a specific image by its name.
    #
    # - name: The name of the image to delete.
    # - force: (Optional) Force removal of the image. Default is false.
    # - no_prune: (Optional) Do not delete untagged parents. Default is false.
    #
    # Returns an array of image delete response items.
    def delete(name : String, force = false, no_prune = false) : Array(Docr::Types::ImageDeleteResponseItem)
      @client.call("DELETE", "/images/#{name}") do |response|
        body = response.body_io.gets_to_end
        return Array(Docr::Types::ImageDeleteResponseItem).from_json(body)
      end
    end
  end
end
