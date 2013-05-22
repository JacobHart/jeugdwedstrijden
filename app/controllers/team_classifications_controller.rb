class TeamClassificationsController < ApplicationController
before_filter :authorize_user

  def create
    @team_classification = TeamClassification.new
    @team_classification.team_id = params[:team_id]
    @team_classification.heat_id = params[:heat_id]
    @team_classification.boat_id = params[:boat_id]

    if @team_classification.save
      redirect_to :back, notice: "Team and boat added successfully to heat"
        else
      flash[:error] = @team_classification.errors.full_messages
      redirect_to :back
    end
  end

  def update
    @team_classification = TeamClassification.find_by_id(params[:id])
    @team_classification.team_id = params[:team_id]
    @team_classification.heat_id = params[:heat_id]
    @team_classification.boat_id = params[:boat_id]

    if @team_classification.save
            redirect_to :back, notice: "Team and boat updated successfully"
          else
      flash[:error] = @team_classification.errors.full_messages
      redirect_to :back
    end
  end

  def destroy
    @team_classification = TeamClassification.find_by_id(params[:id])
    @team_classification.destroy
        redirect_to :back, notice: "Team and boat removed successfully from heat"
      end
end
