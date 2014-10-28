class PlacesController < ApplicationController

  def fetch_specs
    @place = Place.new
    specs = @place.get_specs(params[:file])
    render json: specs
  end

  def create
    @room = Room.find(params[:room_id])
    @place = Place.new(place_params)
    @place.room_id = @room.id
    if @place.save
      render json: @place
    else
      render text: "Something went wrong"
    end
  end

  def destroy
    @place = Place.find(params[:id])
    if @place.delete
      render text: "Deleted"
    else
      render json: @place
    end
  end

  private

  def place_params
    params.require(:place).permit(:url, :address, :price, :beds, :baths, :sqft, :amenities)
  end

end
