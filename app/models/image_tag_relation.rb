class ImageTagRelation < ApplicationRecord
  belongs_to :tag
  belongs_to :post_image
end
