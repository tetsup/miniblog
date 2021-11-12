# Preview all emails at http://localhost:3000/rails/mailers/comment_mailer
class CommentMailerPreview < ActionMailer::Preview
  def comment
    comment = Comment.new(user_id: 2, timeline_id: 11, content: 'コメントテストです。')
    CommentMailer.send_mail(comment)
  end
end
