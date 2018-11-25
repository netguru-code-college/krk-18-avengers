# frozen_string_literal: true

class Event < ApplicationRecord
  has_many :users_events
  has_many :users, through: :users_events
  has_many :products
  has_many :users_products, through: :products
  belongs_to :owner, class_name: 'User'
end
