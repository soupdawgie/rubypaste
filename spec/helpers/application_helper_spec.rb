require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe "full_title" do
    it "returns base title" do
      expect(full_title("")).to eq "Rubypaste"
    end

    it "returns full title" do
      str = "Welcome"
      expect(full_title(str)).to eq "#{str} | Rubypaste"
    end
  end

  describe "glyph" do
    it "returns <i> with passed name" do
      name = "log-in"
      expect(glyph("log-in")).to eq "<i class='glyphicon glyphicon-#{name}'></i>#{" "}".html_safe
    end

    it "returns <i> with passed name and text" do
      name = "log-in"
      text = "Sign in"
      expect(glyph(name, text)).to eq "<i class='glyphicon glyphicon-#{name}'></i>#{" " + text}".html_safe
    end
  end
end
