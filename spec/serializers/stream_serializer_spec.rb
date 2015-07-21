require 'spec_helper'

describe StreamSerializer do
  let(:event) { build_stubbed(:event) }
  let(:stream) { build_stubbed(:stream, event: event) }
  let(:serializer) { StreamSerializer.new(stream) }
  let(:adaptor) { ActiveModel::Serializer::Adapter.create(serializer) }

  subject {adaptor.as_json}

  it { should have_key(:event_id) }
  it { should have_key(:token) }

end
