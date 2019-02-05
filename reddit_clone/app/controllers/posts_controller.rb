class PostsController < ApplicationController
  before_action :require_sign_in
  
  def new
    @post = Post.new
  end
  
  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.sub_id = params[:sub_id]
    if @post.save
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.user_id == current_user.id
      @post.update_attributes(post_params)
      redirect_to post_url(@post)
    else
      flash[:errors] = @post.errors.full_messages
      redirect_to post_url(@post)
    end
  end

  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:title, :url, :content)
  end
end
