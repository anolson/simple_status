class CurrentStatusUpdater
  attr_reader :message, :status

  def self.update(message, status)
    new(message, status).update
  end

  def initialize(message, status)
    @message = message
    @status = status
  end

  def update
    if only_update_status?
      update_current_status
    elsif only_create_message?
      create_message
    else
      update_current_status_and_create_message
    end

    current
  end

  private

  def current
    @current ||= CurrentStatus.first
  end

  def update_current_status
    current.update_attributes(status: status)
  end

  def update_current_status_and_create_message
    update_current_status
    create_message
  end

  def create_message
    Message.create(body: message[:body], status: current.status)
  end

  def only_create_message?
    status.blank?
  end

  def only_update_status?
    message.blank?
  end
end