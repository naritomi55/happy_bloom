class RemovePostImageIdFromTags < ActiveRecord::Migration[6.1]
  def change
    remove_column :tags, :post_image_id, :integer
  end
end
