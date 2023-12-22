require "./spec_helper"

api = Docr::API.new(Docr::Client.new)

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
    result = api.sys.version
    
    result.should_not be_nil
    result.should be_a Docr::Types::SystemVersion
  end

  it "should ping the server" do
    result = api.sys.ping

    result.should_not be_nil
    result.should be_a String
    result.should eq "OK"
  end

  it "should retrieve system events" do
    _ = api.sys.events
  end
end
