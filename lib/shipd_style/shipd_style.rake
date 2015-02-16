require_relative 'copy_directory'
require_relative 'copy_stylesheets'

namespace :shipd_style do
  desc "Copy all stylesheets to a directory"
  task :copy_stylesheets, [:path] do |t, args|
    path = args[:path] || `pwd`.chomp
    ShipdStyle::CopyStylesheets.new(path).perform
  end

  desc "Copy the templates to a directory"
  task :copy_templates, [:path] do |t, args|
    path = args[:path] || `pwd`.chomp
    ShipdStyle::CopyDirectory.new(path, "templates").perform
  end
end
