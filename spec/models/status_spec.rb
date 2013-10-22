require 'spec_helper'

describe Status do
  it { should ensure_inclusion_of(:state).in_array(Status::VALID_STATES) }
end
