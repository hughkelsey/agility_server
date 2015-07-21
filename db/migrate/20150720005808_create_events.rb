class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :token
      t.string :session_id
      t.string :event_id
      t.string :name

      t.timestamps null: false
    end
  end
end
