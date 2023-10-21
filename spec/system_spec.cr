require "./spec_helper"

client = Docr::Client.new
api = Docr::API.new(client)

describe "System" do
  it "should check the auth" do
    auth = Docr::Types::AuthConfig.new(
      username: "stuffo",
      password: "password",
      email: "user@domain.tld",
      serveraddress: "docker.io",
    )

    expect_raises(Docr::APIException) do
      _ = api.sys.auth(auth)
    end
  end

  it "should retrieve system information" do
    _ = api.sys.info
  end

  it "should retrieve Docker version" do
    _ = api.sys.version
  end

  it "should ping the server" do
    _ = api.sys.ping
  end

  it "should retrieve system events" do
    _ = api.sys.events
  end
end
