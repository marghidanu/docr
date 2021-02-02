require "./spec_helper"

client = Docr::Client.new
api = Docr::API::Networks.new(client)

id : String? = nil

describe "Networks" do
  it "should list all networks" do
    _ = api.list
  end

  it "should create a network" do
    config = Docr::Models::NetworkConfig.new(
      name: "test"
    )

    result = api.create(config)
    id = result.id
  end

  it "should inspect a network" do
    _ = api.inspect(id.to_s)
  end

  it "should delete the network" do
    _ = api.delete(id.to_s)
  end
end
