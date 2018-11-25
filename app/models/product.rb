class Product < ApplicationRecord
  has_many :users_products
  has_many :users, through: :users_products
  belongs_to :event
end
