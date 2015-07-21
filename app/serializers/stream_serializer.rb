class StreamSerializer < ActiveModel::Serializer
  attributes :event_id, :token, :name

  def event_id
    object.event.event_id
  end
end
