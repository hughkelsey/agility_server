class Event < ActiveRecord::Base
  validates_uniqueness_of :event_id
  before_create :generate_event_id

  has_many :streams

  def self.create_with_event_id(args = {})
    begin
      event = self.create!(args)
    rescue ActiveRecord::RecordNotUnique
      retry
    end
  end

  private

  def generate_event_id
    self.event_id = SecureRandom.uuid.first(6).upcase
  end
end
