class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.integer :type
      t.string :title
      t.string :subtitle
      t.string :text
      t.string :image_url
      t.string :video_url
      t.float :lat
      t.float :lng

      t.timestamps
    end
  end
end
