class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'
  has_many :inverse_friends, through: :friendships, source: :user
  has_many :confirmed_friendships, through: :friendships, source: :friend

  def remove_duplicates
    inverse = Friendship.find_by(user_id: friend, friend_id: user)
    destroy
    inverse.destroy
  end
end
