class BoatsController < ApplicationController
before_filter :authorize_user

before_filter :boat_with_team_classification?, only: [:destroy]


def boat_with_team_classification?
        @boat = Boat.find_by_id(params[:id])
        @boat.errors.add(:base, "Can not delete boats which are assigned to teams and heats") unless @boat.team_classifications.count == 0
        unless @boat.errors.blank?
          flash[:error] = @boat.errors.full_messages
          redirect_to :back
        end

end


  def index
    @boats = Boat.all
    @heats = Heat.all.sort! { |a,b| a.name.to_i <=> b.name.to_i }
  end

  def create
    @boat = Boat.new
    @boat.name = params[:name]

    if @boat.save
            redirect_to :back, notice: "Boat created successfully"
          else
      flash[:error] = @boat.errors.full_messages
      redirect_to :back
    end
  end

  def edit
    @boat = Boat.find_by_id(params[:id])
  end

  def update
    @boat = Boat.find_by_id(params[:id])
    @boat.name = params[:name]

    if @boat.save
            redirect_to :back, notice: "Boat updated successfully"
          else
      flash[:error] = @boat.errors.full_messages
      redirect_to :back
    end
  end

  def destroy
    @boat = Boat.find_by_id(params[:id])
    @boat.destroy
        redirect_to :back, notice: "Boat removed successfully"
      end
end
