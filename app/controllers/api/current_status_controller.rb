class Api::CurrentStatusController < ApplicationController
  def update
    status = CurrentStatusUpdater.update(params[:message], params[:status])

    if status.valid?
      render json: status.to_json
    else
      render json: status.errors.to_json, status: 422
    end
  end

  def touch
    current_status.update_attributes(last_updated: Time.current)

    render json: current_status.to_json
  end

  private

  def current_status
    SystemStatus.current
  end
end
