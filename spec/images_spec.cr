require "./spec_helper"

api = Docr::API.new(Docr::Client.new)

describe "Images" do
  it "should build an image" do
    api.images.build(["docr/local:latest", "docr/local:1"], "./example") { }
  end

  it "should retrieve an image" do
    api.images.create("busybox")
  end

  it "should list all images" do
    api.images.list
  end

  it "should inspect an image" do
    api.images.inspect("busybox:latest")
  end

  it "should retrieve image history" do
    result = api.images.history("busybox:latest")
  end

  it "should tag an image" do
    api.images.tag(
      name: "busybox:latest",
      repo: "local/busybox",
      tag: "latest"
    )
  end

  it "should delete an image" do
    api.images.delete("local/busybox:latest")
  end
end
