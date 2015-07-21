require 'spec_helper'

describe EventSerializer do
  let(:event) { build_stubbed(:event) }
  let(:serializer) { EventSerializer.new(event) }
  let(:adaptor) { ActiveModel::Serializer::Adapter.create(serializer) }

  subject {adaptor.as_json}

  it { should have_key(:api_key) }
  it { should have_key(:session_id) }
  it { should have_key(:streams)}
  it { should have_key(:event_id)}

  context 'streams' do
    subject {adaptor.as_json[:streams]}
    it {should be_empty}
  end
end
