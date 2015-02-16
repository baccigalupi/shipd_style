module ShipdStyle
  class CopyDirectory < Struct.new(:new_path, :directory_name)
    def perform
      make_directory
      # still using tick marks because of the * at the end of the path
      `cp -r #{source_directory} #{new_path}`
    end

    def make_directory
      FileUtils.mkdir_p(new_path) unless File.exist?(new_path)
    end

    def source_directory
      File.expand_path(File.dirname(__FILE__) + "/../#{directory_name}/*" )
    end
  end
end


