require "./spec_helper"

client = Docr::Client.new
api = Docr::API::Volumes.new(client)

describe "Volumes" do
  it "should create volume" do
    config = Docr::Models::VolumeConfig.new(
      name: "test",
      driver: "local",
    )

    _ = api.create(config)
  end

  it "should list all volumes" do
    _ = api.list
  end

  it "should retrieve inspect volume" do
    _ = api.inspect("test")
  end

  it "should remove volume" do
    _ = api.delete("test")
  end
end
