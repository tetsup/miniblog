class CommentMailer < ApplicationMailer
  def send_mail(comment)
    @comment = comment
    mail(
      from: ENV['MINIBLOG_SMTP_MAILFROM'],
      to: @comment.timeline.user.email,
      subject: 'あなたの投稿にコメントされました'
    )
  end
end
