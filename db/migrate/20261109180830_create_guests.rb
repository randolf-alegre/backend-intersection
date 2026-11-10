class CreateGuests < ActiveRecord::Migration[8.1]
  def up
    create_table :guests do |t|
      t.string :keycard_token, null: false
      t.boolean :check_in_status, default: false

      t.timestamps
    end
  end

  def down
    drop_table :guests
  end
end
