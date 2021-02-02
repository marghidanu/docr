require "./spec_helper"

client = Docr::Client.new
api = Docr::API::System.new(client)

describe "System" do
  it "should check the auth" do
    auth = Docr::Models::AuthConfig.new(
      username: "stuffo",
      password: "password",
      email: "user@domain.tld",
      serveraddress: "docker.io",
    )

    expect_raises(Docr::DockerAPIError) do
      _ = api.auth(auth)
    end
  end

  it "should retrieve system information" do
    _ = api.info
  end

  it "should retrieve Docker version" do
    _ = api.version
  end

  it "should ping the server" do
    _ = api.ping
  end

  it "should retrieve system events" do
    stream = api.events
  end
end
