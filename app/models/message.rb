class Message < ActiveRecord::Base
  attr_accessible :body, :status

  scope :history, lambda { |count| order('created_at DESC').limit(count) }
end