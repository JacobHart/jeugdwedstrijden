class ClubsController < ApplicationController
before_filter :authorize_user, except: [:index, :teams, :rowers]

before_filter :clubs_with_teams_and_rowers?, only: [:destroy]


def clubs_with_teams_and_rowers?
        @club = Club.find_by_id(params[:id])
        @club.errors.add(:base, "Can not delete clubs with rowers and teams assigned") unless @club.teams.count == 0 && @club.rowers.count == 0
        unless @club.errors.blank?
          flash[:error] = @club.errors.full_messages
          redirect_to :back
        end

end




  def teams
    @heats = Heat.all.sort! { |a,b| a.name.to_i <=> b.name.to_i }
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
