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

  def others_debt_count
    sum = 0
    owned_events.each do |event|
      sum += event.users_products.where(is_paid: false).sum(&:amount)
    end
    sum
  end

  def users_debt_count
    users_products.where(is_paid: false).sum(:amount)
  end
end
