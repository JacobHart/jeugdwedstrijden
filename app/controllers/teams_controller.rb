class TeamsController < ApplicationController

  def index
    @teams = Team.all
  end

  def show
    @team = Team.find_by_id(params[:id])
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new
    @team.name = params[:name]
    @team.boat_type_id = params[:boat_type_id]
    @team.club_id = params[:club_id]

    if @team.save
            redirect_to teams_url
          else
      render 'new'
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
            redirect_to teams_url
          else
      render 'edit'
    end
  end

  def destroy
    @team = Team.find_by_id(params[:id])
    @team.destroy
        redirect_to teams_url
      end
end
