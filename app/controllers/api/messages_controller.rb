module Api
  class MessagesController < BaseController
    def index
      messages = SystemStatus.new.recent_messages

      render json: messages
    end

    def create
      message = MessageCreation.create(params[:message])

      render json: message, status: :created
    end
  end
end
