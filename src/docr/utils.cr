require "compress/gzip"

require "crystar"

module Docr
  class Utils
    def self.parse_repository_tag(name : String)
      if name.includes?('@')
        repository, _, tag = name.rpartition('@')
        return {repository, tag}
      end

      repository, tag = name, ""
      if name.includes?(':')
        repository, _, tag = name.rpartition(':')
        repository, tag = name, "" if tag.includes?('/')
      end

      return {repository, tag}
    end

    def self.build_context(path : String) : IO::Memory
      context = IO::Memory.new

      Compress::Gzip::Writer.open(context) do |gzip|
        Crystar::Writer.open(gzip) do |tar|
          gather_files(path).each() do |file|
            tar.add(File.new(file))
          end
        end
      end

      context.rewind
      context
    end

    def self.gather_files(directory : String) : Array(String)
      files = [] of String

      Dir.new(directory).each_child() do |child|
        full_path = File.join(directory, child)

        if File.symlink?(full_path)
          next
        elsif File.directory?(full_path)
          files.concat(gather_files(full_path))
        else
          files << full_path
        end
      end

      files
    end
  end
end
