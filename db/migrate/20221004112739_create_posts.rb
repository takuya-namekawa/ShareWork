class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :tag_id, null: false
      t.integer :shop_id, null: false
      t.string :title, null: false
      t.string :appeal, null: false
      t.string :job, null: false
      t.string :name, null: false
      t.timestamps
    end
  end
end
