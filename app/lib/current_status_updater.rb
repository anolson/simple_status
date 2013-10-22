class CurrentStatusUpdater
  attr_reader :message, :state, :updated

  def self.update(message, state)
    new(message, state).update
  end

  def initialize(message, state)
    @message = message
    @state = state
  end

  def update
    update_current_status_and_create_message
    updated
  end

  private

  def create_status
    @updated = Status.create(state: state, last_updated: Time.current)
  end

  def set_current_status
    Status.update_all(current: false)
    updated.update_attribute(:current, true)
  end

  def update_current_status_and_create_message
    create_status

    if updated.valid?
      set_current_status
      create_message
    end
  end

  def create_message
    MessageCreation.create(message)
  end
end