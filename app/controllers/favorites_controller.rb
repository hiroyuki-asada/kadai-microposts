class FavoritesController < ApplicationController
  before_action :require_user_logged_in, only: [:create, :destroy]
  
  def create
    micropost = Micropost.find(params[:micropost_id])
    current_user.favorite(micropost)
    flash[:success] = 'お気に入り追加'
    redirect_to :back
  end

  def destroy
    micropost = Micropost.find(params[:micropost_id])
    current_user.unfavorite(micropost)
    flash[:success] = 'お気に入り解除'
    redirect_to :back
  end
  
  def index
    @favor_followings = current_user.favor_followings.page(params[:page])
 end
  
  
  
  
  
end

