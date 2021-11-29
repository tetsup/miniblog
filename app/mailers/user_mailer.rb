class UserMailer < ApplicationMailer
  def comment(comment)
    @comment = comment
    mail(
      to: @comment.timeline.user.email,
      subject: 'あなたの投稿にコメントされました'
    )
  end
end
