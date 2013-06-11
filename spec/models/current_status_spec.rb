require 'spec_helper'

describe CurrentStatus do
  it { should ensure_inclusion_of(:status).in_array(CurrentStatus::VALID_STATUSES) }
end
