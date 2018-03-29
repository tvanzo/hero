class CreateLikeComments < ActiveRecord::Migration[5.1]
  def change
    create_table :like_comments do |t|

      t.timestamps
    end
  end
end
