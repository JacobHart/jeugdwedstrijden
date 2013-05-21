class TeamClassificationsController < ApplicationController

  def create
    @team_classification = TeamClassification.new
    @team_classification.team_id = params[:team_id]
    @team_classification.heat_id = params[:heat_id]
    @team_classification.boat_id = params[:boat_id]

    if @team_classification.save
      redirect_to :back, notice: "Signed out successfully"
        else
      render 'new'
    end
  end

  def update
    @team_classification = TeamClassification.find_by_id(params[:id])
    @team_classification.team_id = params[:team_id]
    @team_classification.heat_id = params[:heat_id]
    @team_classification.boat_id = params[:boat_id]

    if @team_classification.save
            redirect_to :back, notice: "Signed out successfully"
          else
      render 'edit'
    end
  end

  def destroy
    @team_classification = TeamClassification.find_by_id(params[:id])
    @team_classification.destroy
        redirect_to :back, notice: "Signed out successfully"
      end
end
