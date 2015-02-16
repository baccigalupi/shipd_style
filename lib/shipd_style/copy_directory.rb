module ShipdStyle
  class CopyDirectory < Struct.new(:path, :directory_name)
    def perform
      make_directory
      # still using tick marks because of the * at the end of the path
      `cp -r #{source_directory} #{path}`
    end

    def make_directory
      FileUtils.mkdir_p(path) unless File.exist?(path)
    end

    def source_directory
      File.expand_path(File.dirname(__FILE__) + "/../#{directory_name}/*" )
    end
  end
end


