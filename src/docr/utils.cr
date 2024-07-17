require "compress/gzip"

require "crystar"

module Docr::Utils
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
    dockerignore = DockerIgnore.new(path)

    Compress::Gzip::Writer.open(context) do |gzip|
      Crystar::Writer.open(gzip) do |tarball|
        Log.debug { "Adding files to tarball" }
        Dir.glob("#{path}/**/*").each do |fpath|
          next unless File.file? fpath
          next if dockerignore.ignored?(fpath)
          rel_path = Path[fpath].relative_to path
          file_info = File.info(fpath)
          hdr = Crystar::Header.new(
            name: rel_path.to_s,
            mode: file_info.permissions.to_i64,
            size: file_info.size,
          )
          tarball.write_header(hdr)
          tarball.write(File.read(fpath).to_slice)
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

  class DockerIgnore
    getter directory : String
    getter ignore_patterns : Array(String)
    getter exception_patterns : Array(String)

    def initialize(@directory)
      @ignore_patterns = [] of String
      @exception_patterns = [] of String

      load_patterns
    end

    private def load_patterns
      ignore_file = File.join(@directory, ".dockerignore")
      return unless File.exists?(ignore_file)

      File.read_lines(ignore_file).each do |line|
        stripped = line.strip
        next if stripped.empty?

        if stripped.starts_with?('!')
          @exception_patterns << stripped[1..-1]
        else
          @ignore_patterns << stripped
        end
      end
    end

    def ignored?(file_path : String) : Bool
      return false if matches_patterns?(file_path, @exception_patterns)
      return true if matches_patterns?(file_path, @ignore_patterns)

      false
    end

    private def matches_patterns?(path : String, patterns : Enumerable(String)) : Bool
      patterns.any? do |pattern|
        Dir.glob(File.join(@directory, pattern)).includes?(path)
      end
    end
  end
end
