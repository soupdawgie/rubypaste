require 'rails_helper'

RSpec.describe User, type: :model do
  subject { build(:user) }

  describe "validations" do
    it 'is valid' do
      expect(subject).to be_valid
    end

    it 'validates email' do
      subject.email = ""
      expect(subject).not_to be_valid
    end

    it 'validates email uniqueness' do
      create(:user)
      expect(build(:user, :invalid)).not_to be_valid
    end

    it 'validates email type' do
      subject.email = "invalid_email.io"
      expect(subject).not_to be_valid
    end

    it 'validates password' do
      subject.password = ""
      expect(subject).not_to be_valid
    end
  end

  it 'has_many snippets' do
    expect(subject.snippets).to be_a(Snippet::ActiveRecord_Associations_CollectionProxy)
  end

end
