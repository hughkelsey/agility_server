class ChangeTokenToStreamId < ActiveRecord::Migration
  def change
    rename_column :streams, :token, :stream_id
  end
end
