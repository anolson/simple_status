class SystemConfig < ActiveRecord::Base
  attr_accessible :name, :description

  before_create :create_api_key

  def create_api_key
    self.api_key = generate_api_key
  end

  private

  def generate_api_key
    Digest::SHA2.hexdigest(SecureRandom.hex(32))
  end
end
