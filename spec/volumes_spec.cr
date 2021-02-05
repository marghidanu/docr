require "./spec_helper"

client = Docr::Client.new
api = Docr::API.new(client)

describe "Volumes" do
  it "should create volume" do
    config = Docr::Types::VolumeConfig.new(
      name: "test",
      driver: "local",
    )

    _ = api.volumes.create(config)
  end

  it "should list all volumes" do
    _ = api.volumes.list
  end

  it "should retrieve inspect volume" do
    _ = api.volumes.inspect("test")
  end

  it "should remove volume" do
    _ = api.volumes.delete("test")
  end
end
