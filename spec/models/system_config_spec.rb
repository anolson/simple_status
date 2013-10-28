require 'spec_helper'

describe SystemConfig do
  describe "#create_api_key" do
    let(:generated_api_key) { SecureRandom.hex(32) }
    
    it "is automatically generated" do
      subject.stubs(generate_api_key: generated_api_key)

      subject.create_api_key
      subject.api_key.should_not be_nil
      subject.api_key.should eq(generated_api_key)
    end
  end
end
