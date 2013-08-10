class Message < ActiveRecord::Base
  belongs_to :status

  attr_accessible :body, :status_id

  scope :history, lambda { |count| order('created_at DESC').limit(count) }

  def as_json(options = {})
    super only: [:body, :status, :created_at]
  end
end