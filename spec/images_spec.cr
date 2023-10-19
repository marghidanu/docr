require "./spec_helper"

def setup
  client = Docr::Client.new
  api = Docr::API.new(client)

  api
end

describe "Images" do
  it "should build an image" do
    api = setup

    api.images.build(["docr/local:latest", "docr/local:1"], "./example") {}
  end

  it "should retrieve an image" do
    api = setup

    api.images.create("busybox")
  end

  it "should list all images" do
    api = setup

    api.images.list
  end

  it "should inspect an image" do
    api = setup

    api.images.inspect("busybox:latest")
  end

  it "should retrieve image history" do
    api = setup

    api.images.history("busybox:latest")
  end

  it "should tag an image" do
    api = setup

    api.images.tag(
      name: "busybox:latest",
      repo: "local/busybox",
      tag: "latest"
    )
  end

  it "should delete an image" do
    api = setup

    api.images.delete("local/busybox:latest")
  end
end
