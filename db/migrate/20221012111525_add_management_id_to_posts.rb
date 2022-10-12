class AddManagementIdToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :management_id, :integer
  end
end
