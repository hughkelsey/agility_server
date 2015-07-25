class Stream < ActiveRecord::Base
  belongs_to :event

  def to_param
    stream_id
  end
end
