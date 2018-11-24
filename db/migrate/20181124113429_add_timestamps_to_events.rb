class AddTimestampsToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :created_at, :datetime, nill: false
    add_column :events, :updated_at, :datetime, nill: false
  end
end
