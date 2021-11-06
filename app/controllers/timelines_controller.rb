class TimelinesController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def index
    if params[:query] == 'following'
      @followings = current_user.following_users
      @timelines = Timeline.where(user_id: @followings).or(Timeline.where(user_id: current_user.id)).eager_load(:user).order(id: "DESC")
    else
      @timelines = Timeline.eager_load(:user).order(id: "DESC")
    end
    @timeline = Timeline.new
  end

  def create
    current_user.timelines.build(timeline_params).save!
    redirect_to timelines_path
  end

  private

  def timeline_params
    params.require(:timeline).permit(:content)
  end
end
