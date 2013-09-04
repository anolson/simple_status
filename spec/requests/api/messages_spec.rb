require 'spec_helper'

describe "Messages API" do
  let!(:message) { Message.create(body: "All systems go!", status_id: status.id) }

  let!(:status) { Status.create(current:true, state: 'up') }

  describe "POST /api/messages" do
    it "creates a new history message" do
      post api_messages_path, { message: { body: 'All systems go!' } }

      response.body.should == Message.first.to_json
      response.status.should == 201
    end
  end

  describe "GET /api/messages" do
    it "returns a list of recent status messages" do
      get api_messages_path

      response.body.should == Message.history(10).to_json
      response.status.should == 200
    end
  end
end