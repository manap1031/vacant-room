class RoomsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

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
      redirect_to root_path
     else
      render :show
     end
  end

  def update
    @room =Room.find(params[:id])
    if @room.update(room_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def edit
    @room = Room.find(params[:id])
  end

  private

  def room_params
    params.require(:room).permit(:room_name, :postal_code, :prefecture_id, :city, :town, :phone_number, :building, :price, :comment, :image, images: [])
  end

  def move_to_index
    unless owner_signed_in?
      redirect_to action: :index
    end
  end
end

