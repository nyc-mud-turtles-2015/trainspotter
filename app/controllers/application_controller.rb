class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?, :redirect_if_not_logged_in

  private

  def current_user
    @current_user ||= Curator.find_by(uid: session[:uid]) if session[:uid]
  end

  def logged_in?
    current_user != nil
  end

  def redirect_if_not_logged_in
    unless logged_in?
      redirect_to login_path
    end
  end

end




