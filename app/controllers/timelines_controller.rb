class TimelinesController < ApplicationController
  def index
    @timelines = Timeline.all.reverse_order
    @timeline = Timeline.new
  end

  def create
    if !current_user.nil?
      Timeline.create(timeline_params)
    end
    redirect_to '/'
  end

  private

  def timeline_params
    params.require(:timeline).permit(:content)
  end
end
