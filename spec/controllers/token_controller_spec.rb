require 'rails_helper'

describe TokenController do
  let(:open_tok) { double.as_null_object  }
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
