class Boat < ActiveRecord::Base
  has_many :team_classifications
  has_many :heats, :through => :team_classifications
  has_many :teams, :through => :team_classifications

end
