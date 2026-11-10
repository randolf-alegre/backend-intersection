class CreateEstablishments < ActiveRecord::Migration[8.1]
  def up
    create_table :establishments do |t|
      t.string :name
      t.references :establishment_category, null: true, foreign_key: true
      t.string :short
      t.string :long
      t.string :maps
      t.string :string
      t.string :cover_image
      t.string :tags

      t.timestamps
    end
  end

  def down
    drop_table :establishments
  end
end
