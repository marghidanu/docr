require "./spec_helper"

client = Docr::Client.new
volumes = Docr::API::Volumes.new(client)

describe "Volumes" do
  it "should create volume" do
    config = Docr::Models::VolumeConfig.new(
      name: "test",
      driver: "local",
    )

    _ = volumes.create(config)
  end

  it "should list all volumes" do
    _ = volumes.list
  end

  it "should retrieve inspect volume" do
    _ = volumes.inspect("test")
  end

  it "should remove volume" do
    _ = volumes.delete("test")
  end
end
