require "./spec_helper"

client = Docr::Client.new
api = Docr::API.new(client)

describe "Images" do
  it "should retrieve an image" do
    api.images.create("busybox")
  end

  it "should list all images" do
    _ = api.images.list
  end

  it "should inspect an image" do
    _ = api.images.inspect("busybox:latest")
  end

  it "should retrieve image history" do
    _ = api.images.history("busybox:latest")
  end

  it "should tag an image" do
    _ = api.images.tag(
      name: "busybox:latest",
      repo: "local/busybox",
      tag: "latest"
    )
  end

  it "should delete an image" do
    _ = api.images.delete("local/busybox:latest")
  end
end
