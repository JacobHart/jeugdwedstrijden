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

  validates :name, presence: true
  validates :boat_type_id, presence: true
  validates :club_id, presence: true

  validates :name, uniqueness: true
end
