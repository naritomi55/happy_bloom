class PostImage < ApplicationRecord
  belongs_to :user
  has_many :tags
  has_many :favorites
  has_many :post_comments

  has_one_attached :image
end
