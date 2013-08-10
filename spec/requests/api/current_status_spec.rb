require 'spec_helper'

describe "Current status API" do
  let(:current) { Time.current }
  let!(:status) { Message.create(body: "All systems go!") }
  let!(:current_status) { Status.create(current: true, status: 'up') }

  before { Time.stubs(current: current) }

  context "updating both the current status and message" do
    it "updates the current message and status" do
      put api_current_status_path, { message: { body: 'Oh noes!' } , status: 'down' }

      response.body.should == SystemStatus.current.to_json
      response.status.should == 200
    end

    context "with invalid parameters" do
      it "does not update the status to anything other than 'up' or 'down'" do
        put api_current_status_path, { message: { body: 'Blurg!' }, status: 'WAT' }

        response.body.should == %{{"status":["must either be up or down."]}}
        response.status.should == 422
      end
    end
  end

  context "touch the current status " do
    it "updates the current status" do
      put touch_api_current_status_path

      response.body.should == SystemStatus.current.to_json
      response.status.should == 200
    end
  end
end