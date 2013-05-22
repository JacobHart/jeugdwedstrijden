class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_admin
  helper_method :signed_in?
  helper_method :authorize_user


  def current_admin
    return Admin.find_by_id(session[:admin_id])
  end

  def signed_in?
    return session[:admin_id].present?
  end

  def authorize_user
    unless signed_in?
      redirect_to about_url, alert: "Please sign in"
    end
  end

end
