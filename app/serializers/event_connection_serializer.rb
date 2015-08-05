class EventConnectionSerializer < ActiveModel::Serializer
  attributes :session_id, :api_key, :event_id, :token

  def api_key
    ENV['OPENTOK_API_KEY']
  end
end
