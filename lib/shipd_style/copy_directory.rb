module ShipdStyle
  class CopyDirectory < Struct.new(:path, :directory_name)
    def perform
      make_directory
      # still using tick marks because of the * at the end of the path
      `cp -r #{source_directory} #{destination_directory}`
    end

    def make_directory
      FileUtils.mkdir_p(destination_directory) unless File.exist?(destination_directory)
    end

    def destination_directory
      "#{path}/#{directory_name}"
    end

    def source_directory
      File.expand_path(File.dirname(__FILE__) + "/../#{directory_name}/*" )
    end
  end
end


