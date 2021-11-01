class FollowsController < ApplicationController
  def create
    if current_user.id != follow_params[:followed_user_id].to_i
      @follow = Follow.new(follow_params)
      @follow.follower_id = current_user.id
      @follow.save
    end
    redirect_to user_path(follow_params[:followed_user_id])
  end

  def destroy
    Follow.find_by(follower_id: current_user.id, followed_user_id: follow_params[:followed_user_id]).destroy
    redirect_to user_path(follow_params[:followed_user_id])
  end

  def follow_params
    params.require(:follow).permit(:followed_user_id)
  end
end