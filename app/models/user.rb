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
  has_many :confirmed_friendships, -> { where(confirmed: true) }, class_name: 'Friendship'
  has_many :friends, through: :confirmed_friendships

  scope :all_except, ->(user) { where.not(id: user) }

  def friends
    friends_array = friendships.map { |friendship| friendship.friend if friendship.confirmed }
    friends_array += inverse_friendships.map { |friendship| friendship.user if friendship.confirmed }
    friends_array.compact
  end

  # Users who have yet to confirme friend requests
  def pending_friends
    friendships.map { |friendship| friendship.friend unless friendship.confirmed }.compact
  end

  # Users who have requested to be friends
  def friend_requests
    inverse_friendships.map { |friendship| friendship.user unless friendship.confirmed }.compact
  end

  def confirm_friend(user)
    friendship = incoming_friend_request.find_by(user_id: user)
    friendship.update(confirmed: true)
    Friendship.create(user: :friendship.friend, friend: :friendship.user, confirmed: true)
  end

  def friend?(user)
    friends.include?(user)
  end

  def friends_and_own_posts
    Post.where(user: (friend_ids + [id]))
  end
end
