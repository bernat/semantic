class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :logged_in?
  
  def logged_in?
    session[:login]
  end
  
  private
  def authenticate
    login = authenticate_or_request_with_http_basic do |username, password|
      username == Semantic::Application.config.authentication.username && Digest::SHA1.hexdigest(password) == Semantic::Application.config.authentication.password
    end
    session[:login] = login
  end
  
  def do_logout
    session[:login] = nil
  end
end
