class RemovePostName < ActiveRecord::Migration
  def up
		remove_column :posts, :name
  end

  def down
		add_column :posts, :role, :string
  end
end
