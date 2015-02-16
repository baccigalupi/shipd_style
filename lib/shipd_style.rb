require 'fileutils'

require "shipd_style/version"
require "shipd_style/copy_directory"
require "shipd_style/copy_stylesheets"

require "compass"
Compass::Frameworks.register('shipd_style', {path: File.dirname(__FILE__)})
