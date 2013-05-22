class AdminsController < ApplicationController

before_filter :authorize_user





  def new
    @clubs = Club.all
    @boat_types = BoatType.all
    @boats = Boat.all
  end

end
