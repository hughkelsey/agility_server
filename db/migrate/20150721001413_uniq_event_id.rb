class UniqEventId < ActiveRecord::Migration
  def change
    add_index :events, :event_id, unique: true
  end
end
