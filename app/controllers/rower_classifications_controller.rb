class RowerClassificationsController < ApplicationController
before_filter :authorize_user




  def create

    RowerClassification.where(team_id: params[:team_id]).each do |rower_classification|
      rower_classification.destroy
    end


  [params[:rower_id_0],params[:rower_id_1],params[:rower_id_2],params[:rower_id_3]].each do |i|
    if i.present?
      @rower_classification = RowerClassification.new
      @rower_classification.rower_id = i
      @rower_classification.team_id = params[:team_id]
      @rower_classification.save
    end
  end

    if @rower_classification.save
            redirect_to :back, notice: "Rowers added to team successfully"
          else
      flash[:error] = @rower_classification.errors.full_messages
      redirect_to :back
    end
  end

  def update
    @rower_classification = RowerClassification.find_by_id(params[:id])
    @rower_classification.rower_id = params[:rower_id]
    @rower_classification.team_id = params[:team_id]

    if @rower_classification.save
            redirect_to :back, notice: "Rowers updated for team successfully"
          else
      flash[:error] = @rower_classification.errors.full_messages
      redirect_to :back
    end
  end

  def destroy
    @rower_classification = RowerClassification.find_by_id(params[:id])
    @rower_classification.destroy
        redirect_to :back, notice: "Rowers removed from team successfully"
      end
end
