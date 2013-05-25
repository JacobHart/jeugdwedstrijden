class TeamsController < ApplicationController
before_filter :authorize_user, except: [:show]


before_filter :teams_with_rowers_or_assigned_to_heats?, only: [:destroy]


def teams_with_rowers_or_assigned_to_heats?
        @team = Team.find_by_id(params[:id])
        @team.errors.add(:base, "Can not delete teams with rowers or assigned to heats") unless @team.team_classifications.count == 0 && @team.rower_classifications.count == 0
        unless @team.errors.blank?
          flash[:error] = @team.errors.full_messages
          redirect_to :back
        end

end




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
