require 'spec_helper'

describe "Messages API" do
  include RequestHelper

  let!(:status) { Status.create(current:true, state: 'up') }

  before { stub_api_authentication }

  describe "POST /api/messages" do
    it "creates a new history message" do
      post api_messages_path, { message: { body: 'All systems go!' } }

      response.body.should == Message.first.to_json
      response.status.should == 201
    end
  end

  describe "GET /api/messages" do
    it "returns a list of recent status messages" do
      get api_messages_path, {}, { 'HTTP_AUTHORIZATION' => 'Basic'}

      response.body.should == Message.history(10).to_json
      response.status.should == 200
    end
  end
end