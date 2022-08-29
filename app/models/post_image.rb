class PostImage < ApplicationRecord
  belongs_to :user
  has_many :tags
  has_many :favorites
  has_many :post_comments

  has_one_attached :image

  validates :image, presence: true

  def favorited_by?(user)
    favorites.exists?(user_id: user_id)
  end
end
