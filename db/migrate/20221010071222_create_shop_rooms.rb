class CreateShopRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :shop_rooms do |t|
      t.integer :shop_id
      t.integer :room_id

      t.timestamps
    end
  end
end
