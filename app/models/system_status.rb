class SystemStatus
  def name
    SimpleStatus::Application.config.system_name
  end

  def current
    CurrentStatus.first
  end

  def messages
    Message.history(10)
  end
end