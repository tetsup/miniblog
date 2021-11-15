class CommentMailer < ApplicationMailer
  def send_mail(comment)
    @comment = comment
    mail(
      to: @comment.timeline.user.email,
      subject: 'あなたの投稿にコメントされました'
    )
  end
end
