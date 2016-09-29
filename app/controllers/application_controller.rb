class ApplicationController < ActionController::Base
  before_filter :basic_auth
  before_filter :auth
  protect_from_forgery

  def current_user
    if session[:github_user_id]
      User.where(:github_id => session[:github_user_id]).first
    end
  end

  private

  def basic_auth
    if Rails.env.production?
      authenticate_or_request_with_http_basic do |username, password|
        username == "mealpal_engineer" && password == ENV.fetch('BASIC_AUTH_PASSWORD')
      end
    end
  end

  def auth
    unless session[:github_user_id]
      session[:return_to] = request.path
      redirect_to "/auth/github"
    end
  end
end
