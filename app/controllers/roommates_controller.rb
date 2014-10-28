class RoommatesController < ApplicationController

  def create
    @room = Room.find(params[:room_id])
    @roommate = Roommate.new(roommate_params)
    @user = User.find_by(email: params[:user_email])
    if @user
      @roommate.user_id = @user.id
      unless Roommate.find_by(room_id: params[:room_id], user_id: @user.id)
        if @roommate.save
          render json: {email: @user.email, roommate_id: @roommate.id, room_id: @room.id, status: 200}, status: 200
        else
          render json: {message: "Something went wrong", status: 500}, status: 500
        end
      else
        render json: {message: "This room already has a roommate with that email", status: 203}, status: 203
      end
    else
      render json: {message: "No user exists with that email", status: 203}, status: 203
    end
  end

  def destroy
    @roommate = Roommate.find(params[:id])
    if @roommate.delete
      render json: {message: "deleted", status: 200}, status: 200
    else
      render json: {message: "Something went wrong", status: 200}, status: 200
    end
  end

  private

  def roommate_params
    params.require(:roommate).permit(:room_id)
  end

end
