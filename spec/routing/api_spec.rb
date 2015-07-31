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
  end
end
