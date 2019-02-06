class CommentsController < ApplicationController
  before_action :require_sign_in
  
  def new
    @comment = Comment.new
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to post_url(@comment.post_id)
    else
      flash[:errors] = @comment.errors.full_messages
      redirect_to post_url(@comment.post_id)
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.user_id == current_user.id
      @comment.update_attributes(comment_params)
      redirect_to post_url(@comment.post_id)
    else
      flash[:errors] = @comment.errors.full_messages
      redirect_to post_url(@comment.post_id)
    end
  end

  def destroy
  end

  private

  def comment_params
    # params.require(:comment).permit(:content)
    params.require(:comment).permit(:content, :post_id)
  end
end
