require "./spec_helper"

client = Docr::Client.new

containers = Docr::API::Containers.new(client)
images = Docr::API::Images.new(client)

images.create("busybox", "latest")

describe "Containers" do
  it "should list all containers" do
    _ = containers.list
  end

  it "should create a new container" do
    config = Docr::Models::ContainerConfig.new(image: "busybox:latest")
    _ = containers.create("abc", config)
  end

  it "should inspect container" do
    _ = containers.inspect("abc")
  end

  # it "should display running processes inside the container" do
  #   expect_raises(Docr::DockerAPIError) do
  #     containers.top("")
  #   end

  #   _ = api.top(CONTAINER_ID)
  # end

  it "should delete the container" do
    containers.delete("abc")
  end
end
