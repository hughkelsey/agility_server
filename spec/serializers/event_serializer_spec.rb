require 'spec_helper'


describe EventSerializer do
  let(:open_tok) { double.as_null_object  }
  let(:event) { build_stubbed(:event) }
  let(:serializer) { EventSerializer.new(event) }
  let(:adaptor) { ActiveModel::Serializer::Adapter.create(serializer) }
  
  before(:each) do
    stub_const("OPENTOK", open_tok)
  end

  subject {adaptor.as_json}

  it { should have_key(:api_key) }
  it { should have_key(:session_id) }
  it { should have_key(:event_id)}
  it { should have_key(:token)}

end
