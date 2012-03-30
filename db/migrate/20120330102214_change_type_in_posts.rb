class ChangeTypeInPosts < ActiveRecord::Migration
  def up
    remove_column :posts, :type
    add_column :posts, :post_type, :string
  end

  def down
  end
end
