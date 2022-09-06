class Tag < ApplicationRecord
  has_many :image_tag_relations, dependent: :destroy
  has_many :post_image, through: :image_tag_relations, dependent: :destroy
end
