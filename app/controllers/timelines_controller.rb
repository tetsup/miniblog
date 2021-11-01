class TimelinesController < ApplicationController
  def index
    if params[:query] == 'following'
      @followings = current_user.following_users
      @timelines = Timeline.where(user_id: @followings).or(Timeline.where(user_id: current_user.id)).joins(:user).select("timelines.*, users.username").all.order(id: "DESC")
    else
      @timelines = Timeline.joins(:user).select("timelines.*, users.username").all.order(id: "DESC")
    end
    @timeline = Timeline.new
  end

  def create
    if !current_user.nil?
      @timeline = Timeline.new(timeline_params)
      @timeline.user_id = current_user.id
      @timeline.save
    end
    redirect_to '/'
  end

  private

  def timeline_params
    params.require(:timeline).permit(:content)
  end
end
