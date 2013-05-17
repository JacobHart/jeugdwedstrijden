class SessionsController < ApplicationController

  def new
  end

  def create
    a = Admin.find_by_name(params[:name])

    if a.present? && a.authenticate(params[:password])
      session[:admin_id] = a.id
      redirect_to admins_url
    else
      redirect_to new_session_url
    end
  end

  def destroy
    reset_session
    redirect_to rowers_url
  end
end
