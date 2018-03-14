class AddInfoToAnswer < ActiveRecord::Migration[5.1]
  def change
    add_column :answers, :content, :string
    add_column :answers, :user_id, :integer
    add_column :answers, :post_id, :integer
  end
end
