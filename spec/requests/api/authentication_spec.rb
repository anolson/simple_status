require "spec_helper"

describe "API Authentication" do
  # include Rack::Test::Methods

  let(:system_config) { SystemConfig.create }

  context "with an invalid api key" do
    it "responds with a 401" do
      get "/api/messages"

      response.status.should eq(401)
    end
  end

  context "with a valid api key" do
    let(:basic_authorization) {
      { "HTTP_AUTHORIZATION" => "Basic " + Base64::encode64("#{system_config.api_key}") }
    }

    it "responds with a 401" do
      get "/api/messages", {}, basic_authorization

      response.status.should eq(200)
    end
  end
end