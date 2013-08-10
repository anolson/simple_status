class SystemStatus
  def self.current
    new.current
  end

  def name
    SimpleStatus::Application.config.system_name
  end

  def current
    Status.current
  end

  def recent_messages(limit = 20)
    Message.history(limit)
  end
end