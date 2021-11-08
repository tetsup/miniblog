class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    current_user.favorites.create!(favorite_params)
    redirect_to request.referrer
  end

  def destroy
    current_user.favorites.find_by_timeline_id(favorite_params[:timeline_id]).destroy!
    redirect_to request.referrer
  end

  def favorite_params
    params.permit(:timeline_id)
  end
end