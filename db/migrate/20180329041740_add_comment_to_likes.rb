class AddCommentToLikes < ActiveRecord::Migration[5.1]
  def change
    add_column :likes, :comment_id, :integer
  end
end
