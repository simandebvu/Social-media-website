require 'rails_helper'

RSpec.describe Friendship, type: :model do
  before :each do 
    @sender = User.create(name: "brannigan", email: "zackleela@te.com", password: "password")
    @receiver = User.create(name: "leela", email: "fryleela@te.com", password: "hayaa")
  end

  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:friend).class_name('User') }
  end

  describe 'validations' do
    subject { Friendship.create(user_id: @sender.id, friend_id: @receiver.id, confirmed: false) }
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:friend_id) }
  end
end
