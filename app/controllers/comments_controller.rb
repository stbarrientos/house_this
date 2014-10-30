class CommentsController < ApplicationController

  before_action :authenticate_user!

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.place_id = params[:place_id]
    if @comment.save
      render json: {body: @comment.body, id: @comment.id, email: current_user.email, status: 200}, status: 200
    else
      render json: {message: @comment.errors, status: 500}, status: 500
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.delete
      render json: {message: "comment deleted", status: 200}, status: 200
    else
      render json: {message: "Something Went Wrong", status: 500}, status: 500
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

end
