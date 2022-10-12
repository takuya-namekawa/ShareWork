class CreateManagementFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :management_favorites do |t|
      t.integer :management_id
      t.integer :post_id

      t.timestamps
    end
  end
end
