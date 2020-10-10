class RoomsController < ApplicationController

  def index
    @rooms = Room.all
  end

  def new
   @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @room = Room.find(params[:id])
  end

  def destroy
     if room = Room.find(params[:id])
      room.destroy
      redirect_to root_paty
     else
      render :show
     end
  end

  def update
  end

  def edit
    @room = Room.find(parms[:id])
  end

  private

  def room_params
    params.require(:room).permit(:room_name, :postal_code, :prefecture_id, :city, :town, :phone_number, :building, :price, :comment, :image, images: [])
  end

end
