class TimelinesController < ApplicationController
  def index
    @timelines = Timeline.all.reverse_order
    @timeline = Timeline.new
  end

  def create
    Timeline.create(timeline_params)
    redirect_to '/'
  end

  private

  def timeline_params
    params.require(:timeline).permit(:content)
  end
end
