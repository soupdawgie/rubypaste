require 'rails_helper'

RSpec.describe SnippetsHelper, type: :helper do
  subject { create(:snippet) }

  describe "count_code" do
    it "counts snippet code without spaces" do
      expect(count_code(subject)).to eq 28
    end
  end

  describe "count_lines" do
    it "counts snippet lines" do
      expect(count_lines(subject)).to eq 3
    end
  end

  describe "count_time" do
    it "counts time and returns a humanized string" do
      subject.created_at = 1.hour.ago
      expect(count_time(subject)).to eq "about 1 hour"
    end
  end

  describe "visibility" do
    it "returns <li> with 'public' class and caption" do
      expect(visibility(subject)).to eq "<li class=\"public\">Public</li>"
    end

    it "returns <li> with 'private' class and caption" do
      subject.public = false
      expect(visibility(subject)).to eq "<li class=\"private\">Private</li>"
    end
  end
end
