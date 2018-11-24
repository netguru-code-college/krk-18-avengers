class CreateJoinTableUserProduct < ActiveRecord::Migration[5.2]
  def change
    create_join_table :products, :users, { table_name: :users_products } do |t|
      t.index [:user_id, :product_id]
      t.boolean :is_paid
    end
  end
end
