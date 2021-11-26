class TimelinesController < ApplicationController
  before_action :authenticate_user!, only: [:following, :create]
  before_action :set_new_timeline, only: [:index, :following]

  def index
    set_comments_and_favorites(Timeline)
  end

  def following
    set_comments_and_favorites(Timeline.following(current_user))
  end

  def show
    @comment = Comment.new
    @timeline = Timeline.where(id: params[:id]).eager_load(:user).eager_load(:comments).preload(:comments_user).first
  end

  def create
    timeline = current_user.timelines.build(timeline_params)
    if timeline.save
      redirect_to request.referrer, notice: '投稿完了しました'
    else
      redirect_to request.referrer, alert: timeline.errors.full_messages.join(', ')
    end
  end

  private

  def timeline_params
    params.require(:timeline).permit(:content, :attached_image_path)
  end

  def set_new_timeline
    @timeline = Timeline.new
  end

  def set_comments_and_favorites(timelines)
    @timelines = timelines.eager_load(:user).eager_load(:comments).preload(:favorite_users).sorted
  end
end
