require 'rails_helper'

RSpec.describe Event, type: :model do

  it { should validate_uniqueness_of(:event_id) }
  it { should have_many(:streams) }

  let(:event) { Event.create_with_event_id }
  let(:open_tok) { double(generate_token: 'token') }

  it "should set the event_id when created" do
    expect(event.event_id).to be_present
  end
  it "should be 6 alpha numberic uppercase characters" do
    expect(event.event_id).to match /\A[A-Z0-9]{6}\z/
  end
  describe "token" do
    before(:each) do
      OPENTOK = open_tok
    end
    it "should be generated by OPENTOK" do
      expect(open_tok).to receive(:generate_token)
      event.token
      event.token # verfy it's called once
    end
  end
end
