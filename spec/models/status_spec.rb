require 'spec_helper'

describe Status do
  it { should ensure_inclusion_of(:status).in_array(Status::VALID_STATUSES) }
end
