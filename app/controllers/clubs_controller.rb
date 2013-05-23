class ClubsController < ApplicationController
before_filter :authorize_user, except: [:index, :teams, :rowers]
  def teams
    @heats = Heat.all
    @teams = Team.all
    @club = Club.find_by_id(params[:id])
    render 'teams/index'
  end

  def rowers
    @rowers = Rower.all
    @club = Club.find_by_id(params[:id])
    render 'rowers/index'
  end

  def index
    @clubs = Club.all
  end

  def create
    @club = Club.new
    @club.name = params[:name]

    if @club.save
      redirect_to :back, notice: "Club created successfully"
    else
      flash[:error] = @club.errors.full_messages
      redirect_to :back
    end
  end

  def edit
    @club = Club.find_by_id(params[:id])
  end

  def update
    @club = Club.find_by_id(params[:id])
    @club.name = params[:name]

    if @club.save
            redirect_to :back, notice: "Club updated successfully"
          else
      flash[:error] = @club.errors.full_messages
      redirect_to :back
    end
  end

  def destroy
    @club = Club.find_by_id(params[:id])
    @club.destroy
        redirect_to :back, notice: "Club removed successfully"
      end
end
