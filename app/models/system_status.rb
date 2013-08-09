class SystemStatus
  def self.current
    new.current
  end

  def name
    SimpleStatus::Application.config.system_name
  end

  def current
    CurrentStatus.first
  end

  def recent_messages(limit = 20)
    Message.history(limit)
  end
end