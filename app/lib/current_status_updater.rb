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
    update_current_status_and_create_message
    current
  end

  private

  def current
    @current ||= SystemStatus.current
  end

  def update_current_status
    current.update_attributes(status: status, last_updated: Time.current)
  end

  def update_current_status_and_create_message
    update_current_status
    create_message
  end

  def create_message
    MessageCreation.create(message)
  end
end