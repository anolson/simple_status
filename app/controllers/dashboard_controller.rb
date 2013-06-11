class DashboardController < ApplicationController
  def index
    @system_status = SystemStatus.new
  end
end
