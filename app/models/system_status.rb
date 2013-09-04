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

  def recent_messages_grouped_by_day
    recent_messages.group_by { |message| message.created_at.to_date }
  end
end