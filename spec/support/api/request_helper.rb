module RequestHelper
  def stub_api_authentication
    ApiAuthenticator.any_instance.stubs(authenticate: true)
  end
end