require_relative 'copy_stylesheets'

namespace :shipd_style do
  desc "Copy all the good stuff to a directory"
  task :copy_stylesheets, [:path] do |t, args|
    path = args[:path] || `pwd`
    ShipdStyle::CopyStylesheets.new(path).perform
  end
end
