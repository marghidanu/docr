require "./spec_helper"

client = Docr::Client.new
_ = Docr::API::Containers.new(client)

describe "Containers" do
  # it "should list all containers" do
  #   _ = api.list
  # end

  # it "should create a new container" do
  #   config = Docr::Models::ContainerConfig.new(
  #     image: "boord/werk:0.3.0"
  #   )

  #   _ = api.create("abc", config)
  # end

  # it "should inspect container" do
  #   _ = api.inspect(CONTAINER_ID)
  # end

  # it "should display running processes inside the container" do
  #   # expect_raises(Docr::DockerAPIError) do
  #   #   api.top("")
  #   # end

  #   _ = api.top(CONTAINER_ID)
  # end
end
