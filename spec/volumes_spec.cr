require "./spec_helper"

api = Docr::API.new(Docr::Client.new)

describe "Volumes" do
  it "should create volume" do
    config = Docr::Types::VolumeConfig.new(
      name: "test",
      driver: "local",
    )

    result = api.volumes.create(config)

    result.should_not be_nil
    result.should be_a Docr::Types::Volume
    result.name.should eq "test"
    result.driver.should eq "local"
  end

  it "should list all volumes" do
    result = api.volumes.list

    result.should_not be_nil
    result.should be_a Docr::Types::VolumeListResponse
    result.volumes.should_not be_nil

    volumes = result.volumes
    unless volumes.nil?
      volumes.should be_a Array(Docr::Types::Volume)
      volumes.empty?.should be_false

      volume_names = volumes.map &.name
      volume_names.should contain "test"
    end
  end

  it "should retrieve inspect volume" do
    expect_raises(Docr::APIException) do
      api.volumes.inspect("not_test")
    end

    result = api.volumes.inspect("test")

    result.should_not be_nil
    result.should be_a Docr::Types::Volume
    result.name.should eq "test"
  end

  it "should remove volume" do
    expect_raises(Docr::APIException) do
      api.volumes.delete("not_test")
    end

    api.volumes.delete("test")
  end
end
