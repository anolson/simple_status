class Api::BaseController < ApplicationController
  before_filter :ensure_authentic_api_request

  private

  def ensure_authentic_api_request
    unless api_authenticator.authenticate
      render nothing: true, status: 401
    end
  end

  def api_authenticator
    ApiAuthenticator.new(self)
  end
end