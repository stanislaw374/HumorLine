class RemoveImageUrlFromPost < ActiveRecord::Migration
  def up
    remove_column :posts, :image_url
    remove_column :posts, :video_url
  end

  def down
  end
end
