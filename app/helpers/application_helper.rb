module ApplicationHelper
  def current_status_alert_class
    if @system_status.current.up?
      'alert-success'
    elsif @system_status.current.down?
      'alert-error'
    end
  end

  def message_body_text_class(message)
    if message.status.up?
      'text-success'
    elsif message.status.down?
      'text-error'
    end
  end
end
