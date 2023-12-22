require "./spec_helper"

api = Docr::API.new(Docr::Client.new)
api.images.create("nginx", "latest")

describe "Containers" do
  it "should create a new container" do
    container = api.containers.create("abc",
      Docr::Types::CreateContainerConfig.new(
        image: "nginx:latest",
        host_config: Docr::Types::HostConfig.new,
      )
    )

    container.should_not be_nil
    container.should be_a Docr::Types::ContainerCreateResponse
    container.id.size.should eq 64

    # Starting the container

    expect_raises(Docr::APIException) do
      api.containers.start("000")
    end

    api.containers.start("abc")
  end

  it "should inspect container" do
    expect_raises(Docr::APIException) do
      api.containers.inspect("000")
    end

    result = api.containers.inspect("abc")

    result.should_not be_nil
    result.should be_a Docr::Types::ContainerInspectResponse
    result.name.should eq "/abc"
  end

  it "should display running processes inside the container" do
    expect_raises(Docr::APIException) do
      api.containers.top(id: "000")
    end

    result = api.containers.top(id: "abc", ps_args: "aux")

    result.should_not be_nil
    result.should be_a Docr::Types::ContainerTopResponse
    result.processes.size.should_not eq 0
  end

  it "should list all containers" do
    result = api.containers.list(
      limit: 1,
      filters: {"name" => ["abc"]},
    )

    result.should_not be_nil
    result.should be_a Array(Docr::Types::ContainerSummary)
    result.empty?.should be_false

    result[0].image.should eq "nginx:latest"
    result[0].names.includes?("/abc").should be_true
  end

  it "should delete the container" do
    api.containers.stop("abc")
    api.containers.delete("abc")

    result = api.containers.list(
      limit: 1,
      filters: {"name" => ["abc"]},
    )

    result.empty?.should be_true
  end
end
