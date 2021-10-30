class TimelinesController < ApplicationController
  def index
    @timelines = Timeline.joins(:user).select("timelines.*, users.username").all.order(id: "DESC")
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
