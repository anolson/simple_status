module Api
  class CurrentStatusController < BaseController
    def show
      render json: current_status.to_json
    end

    def update
      status = CurrentStatusUpdater.update(params[:message], params[:state])

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

end

