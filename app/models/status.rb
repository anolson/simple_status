class Status < ActiveRecord::Base
  VALID_STATUSES = %w( up down )
  has_many :messages

  validates_inclusion_of :status, message: "must either be up or down.", :in => VALID_STATUSES

  attr_accessible :current, :status, :last_updated

  def self.current
    where(current: true).first
  end

  def as_json(options = {})
    super only: [:status, :last_updated]
  end

  def to_s
    status
  end

  def latest_message
    messages.first
  end

  def up?
    status == 'up'
  end

  def down?
    status == 'down'
  end
end
