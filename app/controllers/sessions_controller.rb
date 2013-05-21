class SessionsController < ApplicationController

  def create
    admin = Admin.find_by_name(params[:name])

    if admin.present? && admin.authenticate(params[:password])
      session[:admin_id] = admin.id
      redirect_to :back, notice: "Signed in successfully"
    else
      redirect_to :back, alert: "Wrong password"
    end
  end

  def destroy
    reset_session
    redirect_to :back, notice: "Signed out successfully"
  end
end
