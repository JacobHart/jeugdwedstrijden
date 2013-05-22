class TeamClassification < ActiveRecord::Base
  belongs_to :team
  belongs_to :heat
  belongs_to :boat


  validates :team_id, presence: true
  validates :heat_id, presence: true
  validates :boat_id, presence: true

end
