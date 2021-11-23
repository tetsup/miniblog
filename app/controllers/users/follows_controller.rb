class Users::FollowsController < ApplicationController
  before_action :authenticate_user!

  def create
    current_user.followings.create!(followed_user_id: params[:user_id])
    redirect_to_user_page
  end

  def destroy
    current_user.followings.find_by_followed_user_id(params[:user_id]).destroy!
    redirect_to_user_page
  end

  private

  def redirect_to_user_page
    redirect_to user_path(params[:user_id])
  end

end