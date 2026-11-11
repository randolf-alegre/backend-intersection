class CreatePropertyNeigbhorhood < ActiveRecord::Migration[8.1]
  def up
    create_join_table :properties, :neighborhoods, table_name: :property_neighborhoods do |t|
      t.index [ :property_id, :neighborhood_id ]
      t.index [ :neighborhood_id, :property_id ]
      t.timestamps
    end
    add_index :property_neighborhoods, [ :property_id, :neighborhood_id ], unique: true, name: 'idx_unique_property_neighborhood'
    add_index :property_neighborhoods, [ :neighborhood_id, :property_id ], unique: true, name: 'idx_unique_neighborhood_property'
  end

  def down
    drop_table :property_neighborhoods, force: :cascade
  end
end
