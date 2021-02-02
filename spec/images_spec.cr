require "./spec_helper"

client = Docr::Client.new
api = Docr::API::Images.new(client)

describe "Images" do
  it "should list all images" do
    _ = api.list
  end

  it "should inspect an image" do
    _ = api.inspect("alpine:3.12")
  end

  it "should retrieve image history" do
    _ = api.history("alpine:3.12")
  end

  it "should tag an image" do
    _ = api.tag(
      name: "alpine:3.12",
      repo: "boord/alpine",
      tag: "3.12"
    )
  end

  # it "should delete an image" do
  #   result = api.delete("boord/alpine:3.12")
  #   pp result
  # end
end
