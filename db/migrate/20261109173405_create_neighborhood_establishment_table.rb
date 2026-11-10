class CreateNeighborhoodEstablishmentTable < ActiveRecord::Migration[8.1]
  def up
    create_table :neighborhood_establishment_tables do |t|
      t.references :neighborhood, null: false, foreign_key: true
      t.references :establishment, null: false, foreign_key: true

      t.timestamps
    end
    add_index :neighborhood_establishment_tables, [:neighborhood_id, :establishment_id], unique: true, name: 'idx_unique_neighborhood_establishment'
    add_index :neighborhood_establishment_tables, [:establishment_id, :neighborhood_id], unique: true, name: 'idx_unique_establishment_neighborhood'
  end

  def down
    drop_table :neighborhood_establishment_tables, force: :cascade
  end
end
