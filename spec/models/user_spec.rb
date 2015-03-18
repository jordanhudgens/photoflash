require 'rails_helper'

RSpec.describe User, type: :model do

  before(:each) do
    @user = User.create!(name: "test name", email: "email@yahoo.com", password: "asdfasdf")
  end

  describe "creation" do
    it "should have one item created after being created" do
      expect(User.all.count).to eq(1)
    end  
  end

  describe "validations" do
    it "should not let a user be created without an email address" do
      @user.email = nil
      expect(@user).to_not be_valid
    end

    it "should not let a user be created without a password" do
      @user.password = nil
      expect(@user).to_not be_valid
    end
  end

  describe "length validations" do
    it "should not allow a name longer than 50 characters" do
      @user.name = "j" * 51
      expect(@user).to_not be_valid
    end
  end
end
