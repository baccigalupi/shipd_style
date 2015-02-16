module ShipdStyle
  class CopyStylesheets < Struct.new(:path)
    def perform
      copier.perform
    end

    def remove_namespace
      sass_path = copier.source_path
      FileUtils.mv(sass_path + "/shipd-mobile.scss", sass_path + "/mobile.scss")
      FileUtils.mv(sass_path + "/shipd-tablet.scss", sass_path + "/tablet.scss")
      FileUtils.mv(sass_path + "/shipd-desktop.scss", sass_path + "/desktop.scss")
      # inside contents have to be re-written too:
      contents = File.read(sass_path + "/shipd-all.scss")
      contents.gsub!("shipd-", "")
      File.open(sass_path + "/all.scss", 'w+') do |f|
        f.write contents
      end
      FileUtils.rm(sass_path + "/shipd-all.scss")
    end

    def copier
      @copier ||= ShipdStyle::CopyDirectory.new(path, "sass")
    end
  end
end

