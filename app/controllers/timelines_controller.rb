class TimelinesController < ApplicationController
  before_action :authenticate_user!, only: [:following, :create]
  before_action :set_new_timeline, only: [:index, :following]

  def index
    @timelines = Timeline.eager_load(:user).sorted
  end

  def following
    @timelines = Timeline.following(current_user).eager_load(:user).sorted
  end

  def create
    current_user.timelines.create!(timeline_params)
    redirect_to request.referrer
  end

  private

  def timeline_params
    params.require(:timeline).permit(:content)
  end

  def set_new_timeline
    @timeline = Timeline.new
  end
end
