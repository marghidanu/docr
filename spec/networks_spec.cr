require "./spec_helper"

client = Docr::Client.new
networks = Docr::API::Networks.new(client)

id : String? = nil

describe "Networks" do
  it "should list all networks" do
    _ = networks.list
  end

  it "should create a network" do
    config = Docr::Models::NetworkConfig.new(
      name: "test"
    )

    result = networks.create(config)
    id = result.id
  end

  it "should inspect a network" do
    _ = networks.inspect(id.to_s)
  end

  it "should delete the network" do
    _ = networks.delete(id.to_s)
  end
end
