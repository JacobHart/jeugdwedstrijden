class BoatsController < ApplicationController

  def index
    @boats = Boat.all
    @heats = Heat.all
  end

  def create
    @boat = Boat.new
    @boat.name = params[:name]

    if @boat.save
            redirect_to :back, notice: "Signed out successfully"
          else
      flash[:error] = @club.errors.full_messages
      redirect_to :back
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
      flash[:error] = @club.errors.full_messages
      redirect_to :back
    end
  end

  def destroy
    @boat = Boat.find_by_id(params[:id])
    @boat.destroy
        redirect_to :back, notice: "Signed out successfully"
      end
end
