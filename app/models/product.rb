class Product < ApplicationRecord
  has_many :users_products
  has_many :products, through: :users_products
  accepts_nested_attributes_for :users_products
end
