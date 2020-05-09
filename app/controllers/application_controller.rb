class ApplicationController < ActionController::Base
  helper_method :logged_in?

  private

  def logged_in?
    !!session[:user_id] # ((1))
  end
end
