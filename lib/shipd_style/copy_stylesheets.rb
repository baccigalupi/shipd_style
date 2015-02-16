module ShipdStyle
  class CopyStylesheets < Struct.new(:path)
    def perform
      copier.perform
    end

    def remove_namespace
      destination_directory = "#{path}/sass"
      FileUtils.mv(destination_directory + "/shipd-mobile.scss", destination_directory + "/mobile.scss")
      FileUtils.mv(destination_directory + "/shipd-tablet.scss", destination_directory + "/tablet.scss")
      FileUtils.mv(destination_directory + "/shipd-desktop.scss", destination_directory + "/desktop.scss")
      # inside contents have to be re-written too:
      contents = File.read(destination_directory + "/shipd-all.scss")
      contents.gsub!("shipd-", "")
      File.open(destination_directory + "/all.scss", 'w+') do |f|
        f.write contents
      end
      FileUtils.rm(destination_directory + "/shipd-all.scss")
    end

    def copier
      @copier ||= ShipdStyle::CopyDirectory.new(path + "/sass", "sass")
    end
  end
end

