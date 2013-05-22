class RowersController < ApplicationController

  def index
    @rowers = Rower.all
  end

  def create
    @rower = Rower.new
    @rower.name = params[:name]
    @rower.age = params[:age]
    @rower.club_id = params[:club_id]

    if @rower.save
      redirect_to :back, notice: "Signed out successfully"
    else
      flash[:error] = @club.errors.full_messages
      redirect_to :back
    end
  end

  def edit
    @rower = Rower.find_by_id(params[:id])
  end

  def update
    @rower = Rower.find_by_id(params[:id])
    @rower.name = params[:name]
    @rower.age = params[:age]
    @rower.club_id = params[:club_id]

    if @rower.save
            redirect_to edit_club_url(@rower.club_id), notice: "Signed out successfully"
          else
      flash[:error] = @club.errors.full_messages
      redirect_to :back
    end
  end

  def destroy
    @rower = Rower.find_by_id(params[:id])
    @rower.destroy
        redirect_to :back, notice: "Signed out successfully"
      end
end
