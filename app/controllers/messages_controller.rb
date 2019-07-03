class MessagesController < ApplicationController
  before_action :current_room

  def create
    @message = Message.create(message_params.merge(user_id: current_user.id))
    RoomChannel.broadcast_to @room, @message
  end

  private

  def message_params
    params.require(:message).permit(:message, :room_id)
  end

  def current_room
    @room = Room.find(message_params["room_id"])
  end
end
