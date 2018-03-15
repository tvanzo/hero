class Dropfollowing < ActiveRecord::Migration[5.1]
  def up
    drop_table :followings
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end

end
