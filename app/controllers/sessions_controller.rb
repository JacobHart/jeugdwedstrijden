class SessionsController < ApplicationController

  def new
  end

  def create
    admin = Admin.find_by_name(params[:name])

    if admin.present? && admin.authenticate(params[:password])
      session[:admin_id] = admin.id
      redirect_to admins_url
    else
      redirect_to admins_url
    end
  end

  def destroy
    reset_session
    redirect_to rowers_url
  end
end
