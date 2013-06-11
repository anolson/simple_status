require 'spec_helper'

describe "Current status API" do
  let!(:status) { Message.create(body: "All systems go!") }
  let!(:current_status) { CurrentStatus.create(status: 'up') }

  context "updating both the current status and message" do
    it "updates the current message and status" do
      put api_current_status_path, { message: 'Blurg!', status: 'down' }

      response.body.should == current_status.reload.to_json
      response.status.should == 200
    end
  end

  context "without changing the status" do
    it "updates the current status message" do
      put api_current_status_path, { message: 'Oh noes!' }

      response.body.should == current_status.reload.to_json
      response.status.should == 200
    end
  end

  context "without leaving a message" do
    it "updates the current status" do
      put api_current_status_path, { status: 'down' }

      response.body.should == current_status.reload.to_json
      response.status.should == 200
    end
  end

  context "with invalid parameters" do
    context "when attempting to update both the current status and message" do
      it "does not update the status to anything other than 'up' or 'down'" do
        put api_current_status_path, { message: 'Blurg!', status: 'WAT' }

        response.body.should == %{{"status":["must either be up or down."]}}
        response.status.should == 422
      end
    end

    context "when attempting to only update both the current status" do
      it "does not update the status to anything other than 'up' or 'down'" do
        put api_current_status_path, { status: 'WAT' }

        response.body.should == %{{"status":["must either be up or down."]}}
        response.status.should == 422
      end
    end
  end
end