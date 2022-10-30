class CreateGroupShops < ActiveRecord::Migration[6.1]
  def change
    create_table :group_shops do |t|
      t.references :shop, index: true, foreign_key: true
      t.references :group, index: true, foreign_key: true

      t.timestamps
    end
  end
end
