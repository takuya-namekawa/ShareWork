class CreateEhomakis < ActiveRecord::Migration[6.1]
  def change
    create_table :ehomakis do |t|
      t.integer :shop_id, null: false
      t.integer :year, null: false
      t.integer :booking_target
      t.integer :target_amount, null: false
      t.integer :booking_amount, null: false
      t.integer :store_sales_amount, null: false
      t.integer :total_amount, null: false
      t.timestamps
    end
  end
end
