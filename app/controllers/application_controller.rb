class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :current_user?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_admin?
    current_user && current_user.admin? if current_user
  end

  def current_user?(user)
    current_user.id == user.id if current_user
  end

  def user_logged_in?
    unless session[:user_id]
      flash[:alert] = "Please Log In"
      redirect_to root_path
    end
  end

  def not_found
    redirect_to root_path
    flash[:alert] = "Uh Oh!! That was not allowed."
  end

end
