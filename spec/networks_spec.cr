require "./spec_helper"

client = Docr::Client.new
api = Docr::API.new(client)

id : String? = nil

describe "Networks" do
  it "should list all networks" do
    _ = api.networks.list
  end

  it "should create a network" do
    config = Docr::Types::NetworkConfig.new("test")

    result = api.networks.create(config)
    id = result.id
  end

  it "should inspect a network" do
    _ = api.networks.inspect(id.to_s)
  end

  it "should delete the network" do
    _ = api.networks.delete(id.to_s)
  end
end
