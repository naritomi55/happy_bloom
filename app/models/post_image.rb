class PostImage < ApplicationRecord
  belongs_to :user
  has_many :image_tag_relations, dependent: :destroy
  has_many :tags, through: :image_tag_relations, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_one_attached :image

  validates :image, presence: true

  def favorited_by?(user)
    favorites.exists?(user_id: user_id)
  end
end
