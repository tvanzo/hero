class AddFollowingToUsers < ActiveRecord::Migration[5.1]
  def change
        add_column :users, :following, :string, array: true, default: [].to_yaml
  end
end
