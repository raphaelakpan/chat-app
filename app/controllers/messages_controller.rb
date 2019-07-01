class MessagesController < ApplicationController
  def create
    Message.create(room_params.merge(user_id: current_user.id))
  end

  private

  def room_params
    params.require(:message).permit(:message, :room_id)
  end
end
