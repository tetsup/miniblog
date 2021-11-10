class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    Timeline.find(params[:timeline_id]).comments.create!(comment_params.merge(user: current_user))
    redirect_to request.referrer
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
