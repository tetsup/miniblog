class Timelines::FavoritesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def index
    @favorite_users = Timeline.find(favorite_params[:timeline_id]).favorite_users
  end

  def create
    current_user.favorites.create!(favorite_params)
    redirect_back fallback_location: timelines_path
  end

  def destroy
    current_user.favorites.find_by_timeline_id(favorite_params[:timeline_id]).destroy!
    redirect_back fallback_location: timelines_path
  end

  def favorite_params
    params.permit(:timeline_id)
  end
end