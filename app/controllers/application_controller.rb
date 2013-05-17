class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_admin
  helper_method :signed_in?

  def current_admin
    return Admin.find_by_id(session[:admin_id])
  end

  def signed_in?
    return session[:admin_id].present?
  end


end
