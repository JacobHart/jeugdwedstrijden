class RowerClassificationsController < ApplicationController

  def index
    @rower_classifications = RowerClassification.all
  end

  def show
    @rower_classification = RowerClassification.find_by_id(params[:id])
  end

  def new
    @rower_classification = RowerClassification.new
  end

  def create

  [params[:rower_id_0],params[:rower_id_1],params[:rower_id_2],params[:rower_id_3]].each do |i|
    if params[:rower_id_0].present?
      @rower_classification = RowerClassification.new
      @rower_classification.rower_id = i
      @rower_classification.team_id = params[:team_id]
      @rower_classification.save
    end
  end

    if @rower_classification.save
            redirect_to :back, notice: "Signed out successfully"
          else
      render 'new'
    end
  end

  def edit
    @rower_classification = RowerClassification.find_by_id(params[:id])
  end

  def update
    @rower_classification = RowerClassification.find_by_id(params[:id])
    @rower_classification.rower_id = params[:rower_id]
    @rower_classification.team_id = params[:team_id]

    if @rower_classification.save
            redirect_to :back, notice: "Signed out successfully"
          else
      render 'edit'
    end
  end

  def destroy
    @rower_classification = RowerClassification.find_by_id(params[:id])
    @rower_classification.destroy
        redirect_to :back, notice: "Signed out successfully"
      end
end
