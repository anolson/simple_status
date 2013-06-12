class Api::MessagesController < ApplicationController
  def create
    message = MessageCreation.create(params[:message])

    render json: message, status: 200
  end
end
