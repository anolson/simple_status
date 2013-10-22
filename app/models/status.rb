class Status < ActiveRecord::Base
  VALID_STATES = %w( up down )
  has_many :messages

  validates_inclusion_of :state, message: "must either be up or down.", :in => VALID_STATES

  attr_accessible :current, :state, :last_updated

  def self.current
    where(current: true).first
  end

  def as_json(options = {})
    super only: [:state, :last_updated]
  end

  def to_s
    status
  end

  def latest_message
    messages.history(1).first
  end

  def up?
    state == 'up'
  end

  def down?
    state == 'down'
  end
end
