require 'spec_helper'

describe "Messages API" do
  let!(:status) { CurrentStatus.create(status: 'up') }

  it "creates a new history message" do
    post api_messages_path, { message: { body: 'All systems go!' } }

    response.body.should == Message.first.to_json
    response.status.should == 200
  end
end