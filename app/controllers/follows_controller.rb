class FollowsController < ApplicationController
  before_action :authenticate_user!

  def create
    @follow = current_user.followings.build(follow_params)
    @follow.save!
    redirect_to_user_page
  end

  def destroy
    @follow = current_user.followings.find_by_followed_user_id(follow_params[:followed_user_id])
    @follow.destroy!
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