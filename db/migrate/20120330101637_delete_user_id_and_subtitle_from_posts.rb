class DeleteUserIdAndSubtitleFromPosts < ActiveRecord::Migration
  def up
     remove_column :posts, :subtitle
     remove_column :posts, :user_id
     remove_column :posts, :type
     add_column :posts, :type, :string
  end

  def down
  end
end
