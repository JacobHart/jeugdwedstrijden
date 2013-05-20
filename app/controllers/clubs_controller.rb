class ClubsController < ApplicationController

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

  def show
    @club = Club.find_by_id(params[:id])
    @teams = Team.all
    @rowers = Rower.all

  end

  def new
    @club = Club.new
  end

  def create
    @club = Club.new
    @club.name = params[:name]

    if @club.save
            redirect_to clubs_url
          else
      render 'new'
    end
  end

  def edit
    @club = Club.find_by_id(params[:id])
  end

  def update
    @club = Club.find_by_id(params[:id])
    @club.name = params[:name]

    if @club.save
            redirect_to clubs_url
          else
      render 'edit'
    end
  end

  def destroy
    @club = Club.find_by_id(params[:id])
    @club.destroy
        redirect_to clubs_url
      end
end
