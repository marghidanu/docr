require "./spec_helper"

client = Docr::Client.new
api = Docr::API::Images.new(client)

describe "Images" do
  it "should retrieve an image" do
    api.create("busybox")
  end

  it "should list all images" do
    _ = api.list
  end

  it "should inspect an image" do
    _ = api.inspect("busybox:latest")
  end

  it "should retrieve image history" do
    _ = api.history("busybox:latest")
  end

  it "should tag an image" do
    _ = api.tag(
      name: "busybox:latest",
      repo: "local/busybox",
      tag: "latest"
    )
  end

  it "should delete an image" do
    _ = api.delete("local/busybox:latest")
  end
end
