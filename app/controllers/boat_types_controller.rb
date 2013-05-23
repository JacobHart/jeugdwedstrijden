class BoatTypesController < ApplicationController
before_filter :authorize_user, except: [:index, :show]

  def index
    @boat_types = BoatType.all
  end

  def show
    @boat_type = BoatType.find_by_id(params[:id])
  end

  def create
    @boat_type = BoatType.new
    @boat_type.name = params[:name]

    if @boat_type.save
      redirect_to :back, notice: "Category created successfully"
    else
      flash[:error] = @boat_type.errors.full_messages
      redirect_to :back
    end
  end

  def edit
    @boat_type = BoatType.find_by_id(params[:id])
  end

  def update
    @boat_type = BoatType.find_by_id(params[:id])
    @boat_type.name = params[:name]

    if @boat_type.save
      redirect_to :back, notice: "Category updated successfully"
          else
      flash[:error] = @boat_type.errors.full_messages
      redirect_to :back
    end
  end

  def destroy
    @boat_type = BoatType.find_by_id(params[:id])
    @boat_type.destroy
        redirect_to :back, notice: "Category removed successfully"
      end

  def calculaterank
    @boat_type = BoatType.find_by_id(params[:id])

@boat_type.teams.each do |team|
penalties = ((@boat_type.teams.map { |x| x.results.count}).max - team.results.count)

  penalties.times do

      @result = Result.new
      @result.laptime = "10.00"
      @result.team_id = team.id
      @result.save


  end

end

    teams = @boat_type.teams.sort { |b, a| b.results.sum(:laptime).to_f <=> a.results.sum(:laptime).to_f }
    teams.each_with_index do |team, index|
      team.results.each do |result|

        @result = result
        if team.results.sum(:laptime).to_f == @total_time_previous_team
          @result.rank = index
        else
          @result.rank = (index +1)
        end
        @result.laptime = result.laptime
        @result.team_id = team.id
        @result.heat_id = result.heat_id
        @result.save



      end
      @total_time_previous_team = team.results.sum(:laptime).to_f
    end
          redirect_to :back, notice: "Rank calculated successfully"
  end
end
