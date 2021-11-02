class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  
  private

  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['MINIBLOG_BASIC_AUTH_USERNAME'] && password == ENV['MINIBLOG_BASIC_AUTH_PASSWORD']
    end
  end
end
