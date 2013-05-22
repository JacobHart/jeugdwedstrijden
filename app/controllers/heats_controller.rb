class HeatsController < ApplicationController
before_filter :authorize_user, except: [:index, :show]

  def index
    @heats = Heat.all
    @boat_types = BoatType.all
    @results = Result.all
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
            redirect_to :back, notice: "Heat created successfully"
          else
      flash[:error] = @heat.errors.full_messages
      redirect_to :back
    end
  end

  def edit
    @boat_types = BoatType.all
    @heats = Heat.all
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
