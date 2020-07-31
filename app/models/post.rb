class Post < ApplicationRecord
  validates :content, presence: true, length: { maximum: 1000,
                                                too_long: '1000 characters in post is the maximum allowed.' }

  belongs_to :user


  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
end
