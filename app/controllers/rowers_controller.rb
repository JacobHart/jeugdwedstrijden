class RowersController < ApplicationController

  def index
    @rowers = Rower.all
  end

  def show
    @rower = Rower.find_by_id(params[:id])
  end

  def new
    @rower = Rower.new
  end

  def create
    @rower = Rower.new
    @rower.name = params[:name]
    @rower.age = params[:age]
    @rower.club_id = params[:club_id]

    if @rower.save
      redirect_to rowers_url
    else
      render 'new'
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
            redirect_to rowers_url
          else
      render 'edit'
    end
  end

  def destroy
    @rower = Rower.find_by_id(params[:id])
    @rower.destroy
        redirect_to rowers_url
      end
end
