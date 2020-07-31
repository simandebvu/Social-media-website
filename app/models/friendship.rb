class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'
  has_many :confirmed_friends, through: :friendships, source: :friend
  has_many :inverse_friends, through: :friendships, source: :user

  validates_presence_of :user_id, :friend_id

  def remove_duplicates
    inverse = Friendship.find_by(user_id: friend, friend_id: user)
    destroy
    inverse.destroy
  end

  def confirm_friend
    update_attributes(confirmed: true)
    Friendship.create(friend_id: user_id,
                      user_id: friend_id,
                      confirmed: true)
  end
end
