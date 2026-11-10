class AddNameToPropertyTable < ActiveRecord::Migration[8.1]
  def up
    add_column :properties, :name, :string
  end

  def down
    remove_column :properties, :name
  end
end
