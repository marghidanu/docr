module Docr::Errors
  # Custom exception class for Docker API errors.
  class DockerAPIError < Exception
    # The HTTP status code associated with the error.
    getter status_code : Int32

    # Initializes a new instance of the Docker API error.
    #
    # - message: A message describing the error.
    # - status_code: The HTTP status code associated with the error.

    def initialize(message : String, @status_code : Int32)
      super "Code: #{@status_code} Message: #{message}"
    end
  end

  # Custom exception class for Docker build errors.
  class DockerBuildError < Exception
    # Initializes a new instance of the Docker build error.
    #
    # - message: A message describing the build error.
    def initialize(message : String?)
      super "Docker Build Error: #{message}"
    end
  end
end
