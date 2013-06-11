class Api::CurrentStatusController < ApplicationController
  def update
    @status = CurrentStatusUpdater.update(params[:message], params[:status])

    if @status.valid?
      render json: @status.to_json
    else
      render json: @status.errors.to_json, status: 422
    end
  end
end
