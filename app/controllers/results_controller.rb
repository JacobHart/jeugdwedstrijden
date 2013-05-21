class ResultsController < ApplicationController

  def new
    @results = Result.all
    @result = Result.new
    @heats = Heat.all
  end

  def create
    @result = Result.new
    @result.rank = params[:rank]
    @result.laptime = params[:laptime]
    @result.team_id = params[:team_id]
    @result.heat_id = params[:heat_id]

    if @result.save
            redirect_to :back, notice: "Signed out successfully"
          else
      render 'new'
    end
  end

  def edit
    @boat_types = BoatType.all
    @result = Result.find_by_id(params[:id])
    @heats = Heat.all
  end

  def update
    @result = Result.find_by_id(params[:id])
    @result.rank = params[:rank]
    @result.laptime = params[:laptime]
    @result.team_id = params[:team_id]
    @result.heat_id = params[:heat_id]


    if @result.save
            redirect_to :back, notice: "Signed out successfully"
          else
      render 'edit'
    end
  end

  def destroy
    @result = Result.find_by_id(params[:id])
    @result.destroy
        redirect_to :back, notice: "Signed out successfully"
  end

end
