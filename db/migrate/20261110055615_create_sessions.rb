class CreateSessions < ActiveRecord::Migration[8.1]
  def change
    create_table :sessions do |t|
      t.references :actor, polymorphic: true, null: false

      t.timestamps
    end
  end
end
