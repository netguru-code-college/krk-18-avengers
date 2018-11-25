# frozen_string_literal: true

class UsersProduct < ApplicationRecord
  belongs_to :user
  belongs_to :product
end
