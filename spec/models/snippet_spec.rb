require "rails_helper"

RSpec.describe Snippet, type: :model do
  let(:user)    { create(:user) }
  let(:subject) { user.snippets.build(title: "title", code: "code") }
  let(:snippet) { user.snippets.create(title: "title", code: "code") }

  describe "validations" do
    it "is valid" do
      expect(subject).to be_valid
    end

    it "validates code" do
      subject.code = ""
      expect(subject).not_to be_valid
    end

    it "has unique token" do
      subject.save
      expect { snippet.update_attributes(token: subject.token) }.to raise_error(ActiveRecord::RecordNotUnique)
    end
  end

  describe "#title" do
    it "has default title" do
      subject.title = ""
      subject.save
      expect(subject.title).to eq("#{Time.now.strftime("%d %B %Y, %H:%M")}")
    end

    it "prefers user title" do
      subject.save
      expect(subject.title).to eq("title")
    end
  end

  describe "#new_token" do
    it "can create new token" do
      expect(Snippet.new_token.length).to eq 10
      expect(Snippet.new_token.class).to eq String
    end

    it "creates token before create" do
      expect(subject.token).to be_nil
      subject.save
      expect(subject.token).not_to be_nil
    end
  end

  it "is public by default" do
    expect(subject.public).to be true
  end

  it "belongs_to user" do
    expect(subject.user_id).to eq 1
  end
end
