class CreateProperties < ActiveRecord::Migration[8.1]
  def up
    create_table :properties do |t|
      t.string :address
      t.string :description

      t.timestamps
    end
  end

  def def down 
    drop_table :properties
  end
end
