class HeatsController < ApplicationController
before_filter :authorize_user, except: [:index, :show]

before_filter :heats_with_results_or_assigned_teams?, only: [:destroy]


def heats_with_results_or_assigned_teams?
        @heat = Heat.find_by_id(params[:id])
        @heat.errors.add(:base, "Can not delete heat with results or teams assigned") unless @heat.results.count == 0 && @heat.team_classifications.count == 0
        unless @heat.errors.blank?
          flash[:error] = @heat.errors.full_messages
          redirect_to :back
        end

end



  def index
    @heats = Heat.all.sort! { |a,b| a.name.to_i <=> b.name.to_i }
    @boat_types = BoatType.all
    @results = Result.all

    respond_to do |format|
      format.html
      format.xls
    end

  end

  def show
    @heat = Heat.find_by_id(params[:id])
  end

  def new
    @heat = Heat.new
  end

  def create
    @heat = Heat.new
    @heat.name = params[:name]

    if @heat.save
            redirect_to edit_heat_url, notice: "Heat created successfully"
          else
      flash[:error] = @heat.errors.full_messages
      redirect_to :back
    end
  end

  def edit
    @boat_types = BoatType.all
    @heats = Heat.all.sort! { |a,b| a.name.to_i <=> b.name.to_i }
    @heat = Heat.find_by_id(params[:id])
  end

  def update
    @heat = Heat.find_by_id(params[:id])
    @heat.name = params[:name]

    if @heat.save
            redirect_to :back, notice: "Heat updated successfully"
          else
      flash[:error] = @heat.errors.full_messages
      redirect_to :back
    end
  end

  def destroy
    @heat = Heat.find_by_id(params[:id])
    @heat.destroy
    redirect_to :back, notice: "Head removed successfully"

  end
end
