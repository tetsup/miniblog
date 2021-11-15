class ApplicationMailer < ActionMailer::Base
  default from: ENV['MINIBLOG_SMTP_MAILFROM']
  layout 'mailer'
end
