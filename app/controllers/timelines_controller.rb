class TimelinesController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def index
    if params[:query] == 'following'
      @timelines = Timeline.following(current_user).eager_load(:user).sorted
    else
      @timelines = Timeline.eager_load(:user).sorted
    end
    @timeline = Timeline.new
  end

  def create
    current_user.timelines.build(timeline_params).save!
    redirect_to request.referrer
  end

  private

  def timeline_params
    params.require(:timeline).permit(:content)
  end
end
