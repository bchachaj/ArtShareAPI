class CommentsController < ApplicationController
  def create
    comment = Comment.new(comment_params)
    if comment.save
      render json:comment
    else
      render json: comment.errors.full_messages, status: :unprocessable_entity
    end
  end

  def index
    unless params[:user_id] || params[:artwork_id]
      render json: ['Must have a user_id or artwork_id']
      return
    end
    thing = params[:user_id] ? User.find(params[:user_id]) : Artwork.find(params[:artwork_id])
    comments = thing.comments
    if comments
      render json: comments
    else
      render json: comments.errors.full_messages
    end
  end

  def destroy
    Comment.find(params[:id]).destroy
    render plain: "Successfully deleted"
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter_id, :artwork_id, :body)
  end

end
