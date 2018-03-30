class CreateWallposts < ActiveRecord::Migration[5.1]
  def change
    create_table :wallposts do |t|
      t.string :content
      t.integer :user_id
      t.string :youtuber

      t.timestamps
    end
  end
end
