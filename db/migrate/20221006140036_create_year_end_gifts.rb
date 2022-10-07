class CreateYearEndGifts < ActiveRecord::Migration[6.1]
  def change
    create_table :year_end_gifts do |t|
      t.integer :shop_id, null: false
      t.integer :year, null: false
      t.integer :target_number, null: false
      t.integer :target_amount, null: false
      t.integer :total_amount, null: false
      t.integer :number, null: false
      t.timestamps
    end
  end
end
