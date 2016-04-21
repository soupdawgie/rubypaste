require 'rails_helper'

RSpec.describe UsersHelper, type: :helper do
  subject { create(:user) }

  describe "#appeal" do
    it "returns name" do
      expect(appeal(subject)).to eq "Hi, #{subject.name}!"
    end

    it "returns username if name is empty" do
      subject.name = ""
      expect(appeal(subject)).to eq "Hi, #{subject.username}!"
    end

    it "returns email if both are empty" do
      subject.name = ""
      subject.username = ""
      expect(appeal(subject)).to eq "#{subject.email}"
    end
  end

  describe "#guest" do
    it "returns guest email" do
      params[:guest] = '1'
      expect(guest("email")).to eq "guest@rubypaste.io"
    end

    it "returns guest password" do
      params[:guest] = '1'
      expect(guest("password")).to eq "guestpassword"
    end
  end
end
