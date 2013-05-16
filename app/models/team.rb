class Team < ActiveRecord::Base
  has_many :team_classifications
  has_many :boats, :through => :team_classifications
  has_many :results
  has_many :heats, :through => :team_classifications
  belongs_to :club
  has_many :rower_classifications
  has_many :rowers, :through => :rower_classifications
  belongs_to :boat_type
  has_many :results

  validates :name, :boat_type_id, :club_id, :presence => true
end
