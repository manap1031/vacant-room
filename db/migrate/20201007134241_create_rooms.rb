class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.string  :room_name,          null: false
      t.string  :postal_code,        null: false
      t.integer :prefecture_id,      null: false
      t.string  :city,               null: false
      t.string  :town,               null: false
      t.string  :phone_number,       null: false
      t.string  :building,           null: false
      t.integer :price,              null: false
      t.text    :comment,            null: false
      t.integer :owner_id,           null: false
      t.timestamps
    end
  end
end
