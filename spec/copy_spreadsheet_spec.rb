require 'spec_helper'

require_relative "../lib/shipd_style/copy_directory"
require_relative "../lib/shipd_style/copy_stylesheets"

RSpec.describe ShipdStyle::CopyStylesheets do
  let(:copier) { ShipdStyle::CopyStylesheets.new(copy_dir) }
  let(:copy_dir) { File.dirname(__FILE__) + "/support/copy_dir" }

  before { `rm -rf #{copy_dir}/*` }

  describe "#perform" do
    it "copies over shipd style sass sheets" do
      copier.perform
      expect(File.exist?(copy_dir + "/sass")).to be(true)
    end
  end

  describe "#remove_namespace" do
    before { copier.perform }
    let(:all_scss_content) { File.read(copy_dir + "/sass/all.scss") }

    it "renames the base style sheets to not include shipd" do
      copier.remove_namespace
      expect(File.exist?(copy_dir + "/sass/shipd-mobile.scss")).not_to be(true)
      expect(File.exist?(copy_dir + "/sass/mobile.scss")).to be(true)
    end

    it "changes the content of the all.scss file" do
      copier.remove_namespace
      expect(all_scss_content).not_to include("shipd-")
    end
  end
end
