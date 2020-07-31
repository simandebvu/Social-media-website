require 'rails_helper'

RSpec.describe User, type: :model do

  describe '#checkName' do
    it "Validates presence of username" do
      user = User.new
      user.name = nil
      user.valid?
      expect(user.errors[:name]).to include("can't be blank")
    end
  end

  describe '#checkEmail' do
    it "Validates presence of email" do
      user = User.new
      user.name = "whato"
      user.email = nil
      user.password = "davinci"
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end
  end

  describe '#checkPassword' do
    it "Validates presence of password" do
      user = User.new
      user.name = "blabla"
      user.password = ''
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end
  end

end
