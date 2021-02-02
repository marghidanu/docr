require "./spec_helper"

client = Docr::Client.new
images = Docr::API::Images.new(client)

describe "Images" do
  it "should retrieve an image" do
    images.create("busybox")
  end

  it "should list all images" do
    _ = images.list
  end

  it "should inspect an image" do
    _ = images.inspect("busybox:latest")
  end

  it "should retrieve image history" do
    _ = images.history("busybox:latest")
  end

  it "should tag an image" do
    _ = images.tag(
      name: "busybox:latest",
      repo: "local/busybox",
      tag: "latest"
    )
  end

  it "should delete an image" do
    _ = images.delete("local/busybox:latest")
  end
end
