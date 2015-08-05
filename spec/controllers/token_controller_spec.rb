require 'rails_helper'

describe TokenController do
  let(:open_tok) { double(:open_tok, generate_token: 'token', create_session: double(:session, session_id: 'foo')) }

  before(:each) do
    stub_const("OPENTOK", open_tok)
  end

  describe "create" do
    it "should work" do
      post :create
      expect(response).to be_ok
    end
  end
end
