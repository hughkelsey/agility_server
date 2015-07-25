require 'rails_helper'


describe StreamsController do
  let!(:event) {create(:event)}
  describe "create" do
    it "should require an event_id as the id" do
      post :create, token_id: event.event_id, stream: {name: "foo", stream_id: '1234567543634565436ajhwfgkqwehg'}
      expect(response).to be_ok
    end
  end
  describe "get" do
    let!(:stream) { event.streams.create!(stream_id: '1234567543634565436ajhwfgkqwehg') }
    it "should retrieve a stream" do
      get :show, token_id: event.event_id, id: '1234567543634565436ajhwfgkqwehg'
      expect(response).to be_ok
    end
    context "not found" do
      it "should return a 404" do
        get :show, token_id: event.event_id, id: '123456789'
        expect(response.status).to eql 404
      end
    end
  end
  describe "update" do
    let(:stream) { event.streams.create(stream_id: '12345678') }
    it "should retrieve a stream" do
      patch :update, token_id: event.event_id, id: stream.stream_id, stream: {name: "foo"}
      expect(response).to be_ok
      expect(stream.reload.name).to eql('foo')
    end
  end
end
