class AdminsController < ApplicationController

  def index
    @admins = Admin.all
  end

  def show
    @admin = Admin.find_by_id(params[:id])
  end

  def new
    @admin = Admin.new
    @clubs = Club.all
    @boat_types = BoatType.all
    @boats = Boat.all
  end

  def create
    @admin = Admin.new(params[:admin])

    if @admin.save
      redirect_to admins_url, notice: "Admin created successfully"
    else
      render 'new'
    end
  end

  def edit
    @admin = Admin.find_by_id(params[:id])
  end

  def update
    @admin = Admin.find_by_id(params[:id])
    @admin.name = params[:name]
    @admin.password_digest = params[:password_digest]

    if @admin.save
      redirect_to admins_url, notice: "Admin updated successfully"
    else
      render 'edit'
    end
  end

  def destroy
    @admin = Admin.find_by_id(params[:id])
    @admin.destroy
    redirect_to admins_url, notice: "Admin deleted successfully"
  end
end
