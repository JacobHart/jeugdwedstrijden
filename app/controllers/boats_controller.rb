class BoatsController < ApplicationController

  def index
    @boats = Boat.all
    @heats = Heat.all
  end

  def show
    @boat = Boat.find_by_id(params[:id])
  end

  def new
    @boat = Boat.new
  end

  def create
    @boat = Boat.new
    @boat.name = params[:name]

    if @boat.save
            redirect_to :back, notice: "Signed out successfully"
          else
      render 'new'
    end
  end

  def edit
    @boat = Boat.find_by_id(params[:id])
  end

  def update
    @boat = Boat.find_by_id(params[:id])
    @boat.name = params[:name]

    if @boat.save
            redirect_to :back, notice: "Signed out successfully"
          else
      render 'edit'
    end
  end

  def destroy
    @boat = Boat.find_by_id(params[:id])
    @boat.destroy
        redirect_to :back, notice: "Signed out successfully"
      end
end
