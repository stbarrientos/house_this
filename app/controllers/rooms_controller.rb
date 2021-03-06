class RoomsController < ApplicationController

  before_action :authenticate_user!
  before_action :get_rooms

  def index
    @notifications = current_user.roommates.where(accepted: false)
    @rooms = current_user.roommates.where(accepted:true).map do |r|
      Room.find(r.room_id)
    end

    if @rooms.length < 2
      if @rooms.length > 0
        redirect_to room_path(@rooms.first.id)
      else
        redirect_to new_room_path
      end
    end
  end

  def show
    if current_user.rooms.find_by(id: params[:id])
      @room = Room.find(params[:id])
      @notifications = current_user.roommates.where(accepted: false)
      @users = []
      @room.users.each do |u|
        @users << {roommate_id: u.roommates.find_by(room_id: @room.id, user_id: u.id).id, email: u.email}
      end
      @places = @room.places
    else
      redirect_to rooms_path
    end
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.create(room_params)
    Roommate.create(user_id: current_user.id, room_id: @room.id, accepted: true)
    if @room.save
      redirect_to room_path(@room.id)
    else
      redirect_to new_room_path
    end
  end

  def destroy
    @room = Room.find(params[:id])
    if @room.destroy
      redirect_to rooms_path
    else
      redirect_to room_path(@room.id)
    end
  end

  private

  def room_params
    params.require(:room).permit(:name)
  end

  def get_rooms
    @user_rooms = current_user.roommates.where(accepted:true).map do |r|
      Room.find(r.room_id)
    end
  end
end

