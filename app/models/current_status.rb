class CurrentStatus < ActiveRecord::Base
  VALID_STATUSES = %w( up down )
  validates_inclusion_of :status, message: "must either be up or down.", :in => VALID_STATUSES

  attr_accessible :status

  def as_json(options = {})
    super only: [:status, :last_updated]
  end

  def last_updated
    updated_at
  end

  def to_s
    status
  end
end
