require 'rails_helper'

RSpec.describe Snippet, type: :model do
  subject { create(:user).snippets.build(title: "title", code: "code") }

  it 'is valid' do
    expect(subject).to be_valid
  end

  it 'validates code' do
    subject.code = ""
    expect(subject).not_to be_valid
  end

  it 'has default title' do
    subject.title = ""
    subject.save
    expect(subject.title).to eq("#{Time.now.strftime('%d %B %Y, %H:%M')}")
  end

  it 'prefers user title' do
    subject.save
    expect(subject.title).to eq("title")
  end

  it 'is public by default' do
    expect(subject.public).to be true
  end

  it 'belongs_to user' do
    expect(subject.user_id).to eq 1
  end
end
