class EventConnection
  include ActiveModel::Serialization

  attr_accessor :event, :role
  private :event
  delegate :event_id, :session_id, to: :event

  def initialize(event, role = nil)
    @event = event
    @session_id = event.session_id
    @role = role || :publisher
  end

  def token
    @token ||= OPENTOK.generate_token(session_id, role: role)
  end

end
