require 'rails_helper'

RSpec.describe Event, type: :model do

  it { should validate_uniqueness_of(:event_id) }
  it { should have_many(:streams) }

  let(:event) { Event.create_with_event_id }
  it "should set the event_id when created" do
    expect(event.event_id).to be_present
  end
  it "should be 6 alpha numberic uppercase characters" do
    expect(event.event_id).to match /\A[A-Z0-9]{6}\z/
  end
end
