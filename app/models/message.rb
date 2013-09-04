class Message < ActiveRecord::Base
  belongs_to :status

  attr_accessible :body, :status_id

  scope :history, lambda { |count| order('created_at DESC').limit(count) }

  def to_s
    body
  end

  def as_json(options = {})
    super only: [:body, :created_at], methods: :state
  end

  def state
    status.state
  end
end