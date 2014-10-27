class RoomsController < ApplicationController

  before_action :authenticate_user!

  def index
    @rooms = current_user.rooms
    unless @rooms.length > 1
      redirect_to room_path(@rooms.first.id)
    end
  end

  def fetch_specs
    @place = Place.new
    specs = @place.get_specs(params[:file])
    render json: specs
  end

  def show
    @room = Room.find(params[:id])
    @users = @room.users
    @places = @room.places
    @places_hash = []
    puts params
  end

  def create
  end

  private

  def room_params
    params.require(:room).permit(:address, :baths, :beds, :price, :sqft, :amenities)
  end

end

