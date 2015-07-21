class CreateStreams < ActiveRecord::Migration
  def change
    create_table :streams do |t|
      t.belongs_to :event, index: true, foreign_key: true
      t.string :token
      t.string :name

      t.timestamps null: false
    end
  end
end
