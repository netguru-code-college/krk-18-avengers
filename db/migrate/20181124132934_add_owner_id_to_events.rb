# frozen_string_literal: true

class AddOwnerIdToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :owner_id, :integer, index: true
  end
end
