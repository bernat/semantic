class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :logged_in?

  def logged_in?
    user_signed_in?
  end

end
