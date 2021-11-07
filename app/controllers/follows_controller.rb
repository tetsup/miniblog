class FollowsController < ApplicationController
  before_action :authenticate_user!

  def create
    current_user.followings.build(follow_params).save!
    redirect_to_user_page
  end

  def destroy
    current_user.followings.find_by_followed_user_id(follow_params[:followed_user_id]).destroy!
    redirect_to_user_page
  end

  private

  def follow_params
    params.require(:follow).permit(:followed_user_id)
  end

  def redirect_to_user_page
    redirect_to user_path(follow_params[:followed_user_id])
  end

end