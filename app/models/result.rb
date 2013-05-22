class Result < ActiveRecord::Base
    belongs_to :team
    belongs_to :heat

  validates :rank, presence: true
  validates :laptime, presence: true
  validates :team_id, presence: true
  validates :heat_id, presence: true
end
