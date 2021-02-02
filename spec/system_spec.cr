require "./spec_helper"

client = Docr::Client.new
sys = Docr::API::System.new(client)

describe "System" do
  it "should check the auth" do
    auth = Docr::Models::AuthConfig.new(
      username: "stuffo",
      password: "password",
      email: "user@domain.tld",
      serveraddress: "docker.io",
    )

    expect_raises(Docr::DockerAPIError) do
      _ = sys.auth(auth)
    end
  end

  it "should retrieve system information" do
    _ = sys.info
  end

  it "should retrieve Docker version" do
    _ = sys.version
  end

  it "should ping the server" do
    _ = sys.ping
  end

  it "should retrieve system events" do
    _ = sys.events
  end
end
