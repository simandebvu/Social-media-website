class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 20 }
  has_many :posts
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :friendships
  has_many :inverse_friendships, class_name: 'Friendship', foreign_key: 'friend_id'
  has_many :confirmed_friendships, -> { where confirmed: true }, class_name: 'Friendship'
  has_many :friends, through: :confirmed_friendships
  has_many :pending_friendships, -> { where confirmed: false }, class_name: 'Friendship', foreign_key: 'user_id'
  has_many :pending_friends, through: :pending_friendships, source: :friend
  has_many :incoming_friendships, -> { where confirmed: false }, class_name: 'Friendship', foreign_key: 'friend_id'
  has_many :incoming_friends, through: :incoming_friendships, source: :user

  scope :all_except, ->(user) { where.not(id: user) }

  def friend?(user)
    friends.include?(user)
  end

  def friends_and_own_posts
    Post.where(user: (friend_ids + [id]))
  end

  def pending_request_with(usr)
    incoming_friends.include? usr
  end

  def sent_request?(usr)
    incoming_friends.include? usr
  end

  def confirm_friend(usr)
    friendship = incoming_friendships.find_by(user_id: usr)
    friendship.update(confirmed: true)
    print(friendship.valid?)
    print(friendship.errors.full_messages)
    Friendship.create(friend: friendship.user,
                      user: friendship.friend,
                      confirmed: true)
  end
end
