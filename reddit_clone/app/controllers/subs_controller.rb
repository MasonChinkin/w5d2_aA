class SubsController < ApplicationController
  before_action :require_sign_in
  
  def new
    @sub = Sub.new
  end

  def index
    @subs = Sub.all
  end

  def show
    @sub = Sub.find(params[:id])
  end

  def create
    @sub = Sub.new(sub_params)
    @sub.user_id = current_user.id
    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :new
    end
  end

  def edit
    @sub = Sub.find(params[:id])
  end

  def update
    @sub = Sub.find(params[:id])
    if @sub.user_id == current_user.id
      @sub.update_attributes(sub_params)
      redirect_to sub_url(@sub)
    else
      flash[:errors] = @sub.errors.full_messages
      redirect_to sub_url(@sub)
    end
  end

  def destroy
  end

  private

  def sub_params
    params.require(:sub).permit(:title, :description)
  end
end
