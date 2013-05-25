class RowersController < ApplicationController
before_filter :authorize_user

before_filter :rower_with_rower_classification?, only: [:destroy]


def rower_with_rower_classification?
        @rower = Rower.find_by_id(params[:id])
        @rower.errors.add(:base, "Can not delete rower which is assigned to teams") unless @rower.rower_classifications.count == 0
        unless @rower.errors.blank?
          flash[:error] = @rower.errors.full_messages
          redirect_to :back
        end

end


  def index
    @rowers = Rower.all
  end

  def create
    @rower = Rower.new
    @rower.name = params[:name]
    @rower.age = params[:age]
    @rower.club_id = params[:club_id]

    if @rower.save
      redirect_to :back, notice: "Rower added successfully"
    else
      flash[:error] = @rower.errors.full_messages
      redirect_to :back
    end
  end

  def edit
    @rower = Rower.find_by_id(params[:id])
  end

  def update
    @rower = Rower.find_by_id(params[:id])
    @rower.name = params[:name]
    @rower.age = params[:age]
    @rower.club_id = params[:club_id]

    if @rower.save
            redirect_to edit_club_url(@rower.club_id), notice: "Rower updated successfully"
          else
      flash[:error] = @rower.errors.full_messages
      redirect_to :back
    end
  end

  def destroy
    @rower = Rower.find_by_id(params[:id])
    @rower.destroy
        redirect_to :back, notice: "Rower removed successfully"
      end
end
