require "./spec_helper"

describe "Utils" do
  it "parse_repository_tag" do
    Docr::Utils.parse_repository_tag("root").should eq({"root", ""})
    Docr::Utils.parse_repository_tag("root:tag").should eq({"root", "tag"})
    Docr::Utils.parse_repository_tag("user/repo").should eq({"user/repo", ""})
    Docr::Utils.parse_repository_tag("user/repo:tag").should eq({"user/repo", "tag"})
    Docr::Utils.parse_repository_tag("url:5000/repo").should eq({"url:5000/repo", ""})
    Docr::Utils.parse_repository_tag("url:5000/repo:tag").should eq({"url:5000/repo", "tag"})
    Docr::Utils.parse_repository_tag("root@sha256:digest").should eq({"root", "sha256:digest"})
    Docr::Utils.parse_repository_tag("user/repo@sha256:digest").should eq({"user/repo", "sha256:digest"})
    Docr::Utils.parse_repository_tag("url:5000/repo@sha256:digest").should eq({"url:5000/repo", "sha256:digest"})
  end
end
