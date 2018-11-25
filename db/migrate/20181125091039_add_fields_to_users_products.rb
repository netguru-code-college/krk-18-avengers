class AddFieldsToUsersProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :users_products, :paid_at, :datetime
    add_column :users_products, :amount, :decimal
    change_column :users_products, :is_paid, :boolean, default: false
  end
end
