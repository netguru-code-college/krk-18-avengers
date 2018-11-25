# frozen_string_literal: true

class CreateJoinTableUserEvent < ActiveRecord::Migration[5.2]
  def change
    create_join_table :events, :users, table_name: :users_events do |t|
      t.index %i[user_id event_id]
      # t.index [:event_id, :user_id]
    end
  end
end
