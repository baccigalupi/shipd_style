module ShipdStyle
  class CopyStylesheets < Struct.new(:path)
    def perform
      make_directory
      `cp -r #{sass_directory} #{path}`
    end

    def make_directory
      `mkdir #{path}` unless File.exist?(path)
    end

    def sass_directory
      File.expand_path(File.dirname(__FILE__) + "/../sass/*" )
    end
  end
end
