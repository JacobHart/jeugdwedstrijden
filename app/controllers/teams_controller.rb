class TeamsController < ApplicationController

  def index
    @teams = Team.all
  end

  def show
    @team = Team.find_by_id(params[:id])
  end

  def create
    @team = Team.new
    @team.name = params[:name]
    @team.boat_type_id = params[:boat_type_id]
    @team.club_id = params[:club_id]

    if @team.save
      redirect_to :back, notice: "Team added successfully"
    else
      flash[:error] = @team.errors.full_messages
      redirect_to :back
    end
  end

  def edit
    @team = Team.find_by_id(params[:id])
  end

  def update
    @team = Team.find_by_id(params[:id])
    @team.name = params[:name]
    @team.boat_type_id = params[:boat_type_id]
    @team.club_id = params[:club_id]

    if @team.save
      redirect_to edit_club_url(@team.club_id), notice: "Team updated successfully"
    else
      flash[:error] = @team.errors.full_messages
      redirect_to :back
    end
  end

  def destroy
    @team = Team.find_by_id(params[:id])
    @team.destroy
    redirect_to :back, notice: "Team removed successfully"
  end
end
