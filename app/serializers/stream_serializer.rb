class StreamSerializer < ActiveModel::Serializer
  attributes :id, :event_id, :stream_id, :name

  def event_id
    object.event.event_id
  end
end
