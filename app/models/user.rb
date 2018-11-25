# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :users_events
  has_many :events, through: :users_events
  has_many :users_products
  has_many :products, through: :users_products
  has_many :owned_events, class_name: 'Event', foreign_key: :owner_id
end
