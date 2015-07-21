class RemoveTokenFromEvents < ActiveRecord::Migration
  def change
    remove_column :events, :token
  end
end
