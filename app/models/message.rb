class Message < ActiveRecord::Base
  attr_accessible :body, :status

  scope :history, lambda { |count| order('created_at DESC').limit(count) }

  def as_json(options = {})
    super only: [:body, :status, :created_at]
  end
end