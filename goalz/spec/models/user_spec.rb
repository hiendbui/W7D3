require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:coolest_dude) {User.create(username: 'Coolest Dude', password: "password123")}
  describe "validations" do 
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_presence_of(:session_token) }
    it { should validate_uniqueness_of(:username) }

  end

  # describe "associations" do
  #   it { should have_many(:goals)}
  #   it { should have_many(:comments)}
  #   # it { should }
  #   it { should have_many(:commented_goals)}
  # end

  describe "::find_by_credentials" do
    let(:user) {FactoryBot.create(:user)}

    context "valid username & password are passed" do
      it "should return correct user" do
        banana = User.create(username: 'Coolest Dude', password: "password123")
        expect(User.find_by_credentials('Coolest Dude', "password123")).to eq(banana)
      end
    end

    context "invalid username & password are passed" do
      it "should return nil" do
        expect(User.find_by_credentials('Hottest Dude', "password123")).to eq(nil)
      end
    end
  end
end
