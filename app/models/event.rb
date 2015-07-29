class Event < ActiveRecord::Base
  validates_uniqueness_of :event_id
  validates_presence_of :session_id
  before_create :generate_event_id

  has_many :streams

  def self.create_with_session_id(session_id)
    create_with_event_id(session_id: session_id)
  end

  def self.create_with_event_id(args = {})
    begin
      event = self.create!(args)
    rescue ActiveRecord::RecordNotUnique
      generate_event_id
      retry
    end
  end

  def to_param
    event_id
  end

  def token
    @token ||= OPENTOK.generate_token(session_id, role: :publisher)
  end

  private

  def generate_event_id
    self.event_id = SecureRandom.uuid.first(6).upcase
  end
end
