require 'rails_helper'


describe StreamsController do
  let!(:event) {create(:event)}
  before(:each) do
    allow(OPENTOK).to receive(:generate_token) {'ABC123DEF456'}
  end
  describe "create" do
    it "should require an event_id as the id" do
      post :create, token_id: event.event_id
      expect(response).to be_ok
    end
  end
  describe "get" do
    let(:stream) { event.streams.create(token: '1234567543634565436ajhwfgkqwehg') }
    it "should retrieve a stream" do
      get :show, token_id: event.event_id, id: stream.id
      expect(response).to be_ok
    end
  end
  describe "update" do
    let(:stream) { event.streams.create }
    it "should retrieve a stream" do
      patch :update, token_id: event.event_id, id: stream.id, stream: {name: "foo"}
      expect(response).to be_ok
      expect(stream.reload.name).to eql('foo')
    end
  end
end
