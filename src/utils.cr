module Docr
  class Utils
    def self.parse_repository_tag(name : String)
      if name.includes?('@')
        data = name.rpartition('@')
        return {data[0], data[2]}
      end

      repository, tag = name, ""
      if name.includes?(':')
        data = name.rpartition(':')
        repository, tag = data[0], data[2]

        repository, tag = name, "" if tag.includes?('/')
      end

      return {repository, tag}
    end
  end
end

# def parse_repository_tag(repo_path):
#     tag_separator = ":"
#     digest_separator = "@"

#     if digest_separator in repo_path:
#         repo, tag = repo_path.rsplit(digest_separator, 1)
#         return repo, tag, digest_separator

#     repo, tag = repo_path, ""
#     if tag_separator in repo_path:
#         repo, tag = repo_path.rsplit(tag_separator, 1)
#         if "/" in tag:
#             repo, tag = repo_path, ""

#     return repo, tag, tag_separator
