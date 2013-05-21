class AdminsController < ApplicationController

  def new
    @clubs = Club.all
    @boat_types = BoatType.all
    @boats = Boat.all
  end

end
