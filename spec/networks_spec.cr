require "./spec_helper"

api = Docr::API.new(Docr::Client.new)
id : String? = nil

describe "Networks" do
  it "should create a network" do
    config = Docr::Types::NetworkConfig.new("test")
    result = api.networks.create(config)

    result.should_not be_nil
    result.should be_a Docr::Types::NetworkCreateResponse
    result.id.should_not be_nil

    id = result.id
  end

  it "should list all networks" do
    result = api.networks.list

    result.should_not be_nil
    result.should be_a Array(Docr::Types::Network)
    result.empty?.should be_false

    network_names = result.map &.name
    network_names.should contain "test"
  end

  it "should inspect a network" do
    id.should_not be_nil

    network_id = id
    unless network_id.nil?
      result = api.networks.inspect(network_id)

      result.should_not be_nil
      result.should be_a Docr::Types::Network
      result.name.should eq "test"
    end

    expect_raises(Docr::APIException) do
      api.networks.inspect("missing")
    end
  end

  it "should delete the network" do
    id.should_not be_nil

    network_id = id
    unless network_id.nil?
      api.networks.delete(network_id)
    end

    expect_raises(Docr::APIException) do
      api.networks.delete("missing")
    end
  end
end
