class AddVideoColumnToPost < ActiveRecord::Migration
  def change
    change_table :posts do |t|
      t.has_attached_file :video
    end
  end
end
