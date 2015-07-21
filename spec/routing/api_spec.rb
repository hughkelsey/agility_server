require 'rails_helper'

describe "api routes" do
  describe "/token" do
    it "should route to create" do
      expect(post: "/token.json").to route_to(
      controller: "token", action: 'create', format: 'json'
      )
    end
    it "get '/token/:event_id.json'" do
      expect(get: '/token/1.json' ).to route_to(
      controller: "token", action: 'show', format: 'json', id: '1'
      )
    end
    describe "streams" do
      it "post '/token/:event_id/streams.json'" do
        expect(post: '/token/1/streams.json' ).to route_to(
        controller: 'streams', action: 'create', format: 'json', token_id: '1'
        )
      end
      it "get '/token/:event_id/streams/:stream_id.json' " do
        expect(get: '/token/37/streams/1.json' ).to route_to(
        controller: 'streams', action: 'show', format: 'json', token_id: '37', id: '1'
        )
      end
      it "patch '/token/:event_id/streams/:stream_id' " do
        expect(patch: '/token/37/streams/1.json' ).to route_to(
        controller: 'streams', action: 'update', format: 'json', token_id: '37', id: '1'
        )
      end
    end
  end
end
