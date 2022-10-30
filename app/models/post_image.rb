class PostImage < ApplicationRecord
  belongs_to :user
  has_many :image_tag_relations, dependent: :destroy
  has_many :tags, through: :image_tag_relations, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_one_attached :image

  validates :image, presence: true
  
  attr_accessor :tag

  def self.search(search)
    if search
      where(['title LIKE ?',"%#{search}%"])
    else
      all
    end
  end

  def favorited_by?(user)
    # binding.pry
    favorites.exists?(user_id: user.id)
  end
end
