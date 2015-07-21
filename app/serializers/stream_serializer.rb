class StreamSerializer < ActiveModel::Serializer
  attributes :id, :event_id, :token, :name

  def event_id
    object.event.event_id
  end
end
