class RoomsController < ApplicationController

  def index
    @rooms = Room.all
  end

  def new
   @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if 
      @room.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def destroy
  end

  def update
  end

  def edit
  end

  private

  def room_params
    params.require(:room).permit(:room_name, :comment, :image, images: [])
  end

end
