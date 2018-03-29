class AddCommentToLikecomment < ActiveRecord::Migration[5.1]
  def change
    add_column :like_comments, :comment_id, :integer
    add_column :like_comments, :user_id, :integer
  end
end
