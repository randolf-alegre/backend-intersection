class CreateEstablishmentCategories < ActiveRecord::Migration[8.1]
  def up
    create_table :establishment_categories do |t|
      t.string :name

      t.timestamps
    end
  end

  def down
    drop_table :establishment_categories
  end
end
