class MessageCreation
  attr_reader :message

  def self.create(message)
    new(message).create
  end

  def initialize(message)
    @message = message
  end

  def create
    Message.create(body: message[:body], status_id: current.id)
  end

  private

  def current
    SystemStatus.current
  end
end