class TimelinesController < ApplicationController
  before_action :authenticate_user!, only: [:following, :create]
  before_action :set_new_timeline, only: [:index, :following]

  def index
    set_datas(Timeline)
  end

  def following
    set_datas(Timeline.following(current_user))
  end

  def show
    @comment = Comment.new
    @timeline = Timeline.where(id: params[:id]).eager_load(:user).eager_load(:comments).preload(:comments_user).first
  end

  def create
    current_user.timelines.create!(timeline_params)
    redirect_to request.referrer
  end

  private

  def timeline_params
    params.require(:timeline).permit(:content, :attached_image_path)
  end

  def set_new_timeline
    @timeline = Timeline.new
  end

  def set_datas(timelines)
    @timelines = timelines.eager_load(:user).eager_load(:comments).preload(:favorite_users).sorted
  end
end
