class ApiAuthenticator
  attr_reader :controller

  def initialize(controller)
    @controller = controller
  end

  def authenticate
    controller.authenticate_with_http_basic { |u,p| authentic?(u) }
  end

  def authentic?(api_key)
    system_config.present? && system_config.api_key == api_key
  end

  def system_config
    @system_config ||= SystemConfig.first
  end
end