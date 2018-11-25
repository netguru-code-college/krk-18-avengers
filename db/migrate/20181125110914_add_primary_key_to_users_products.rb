class AddPrimaryKeyToUsersProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :users_products, :id, :primary_key
  end
end
