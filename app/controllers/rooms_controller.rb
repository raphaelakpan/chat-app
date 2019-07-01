class RoomsController < ApplicationController
  before_action :load_rooms
  before_action :load_room, only: [:show, :edit, :update]

  def index
  end

  def show
    @messages = @room.messages.includes(:user)
    @message = @room.messages.new
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      flash[:success] = "Room #{@room.name} was successfully created"
      redirect_to room_path(@room)
    else
      flash.now[:error] = "There was an error"
      render :new
    end
  end

  def edit
  end

  def update
    if @room.update(room_params)
      flash[:success] = "Room #{room.name} was successfully updated"
      redirect_to rooms_path
    else
      render :edit
    end
  end

  private

  def room_params
    params.require(:room).permit(:name)
  end

  def load_room
    @room = Room.find(params[:id])
  end

  def load_rooms
    @rooms = Room.all
  end
end
