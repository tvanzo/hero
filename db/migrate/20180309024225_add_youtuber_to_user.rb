class AddYoutuberToUser < ActiveRecord::Migration[5.1]
  def change
     add_column :posts, :youtuber, :string
  end
end
