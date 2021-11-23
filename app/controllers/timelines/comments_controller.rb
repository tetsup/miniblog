class Timelines::CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    comment = Timeline.find(params[:timeline_id]).comments.build(comment_params.merge(user: current_user))
    if comment.save
      CommentMailer.send_mail(comment).deliver_now
      redirect_to request.referrer, notice: 'コメント完了しました'
    else
      redirect_to request.referrer, alert: comment.errors.full_messages.join(', ')
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
