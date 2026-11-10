class CreateNeighborhoods < ActiveRecord::Migration[8.1]
  def change
    create_table :neighborhoods do |t|
      t.string :name
      t.string :hashtag
      t.text :description
      t.text :hashtag_description
      t.string :city
      t.string :tags

      t.timestamps
    end
  end
end
