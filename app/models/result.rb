class Result < ActiveRecord::Base
    belongs_to :team
    belongs_to :heat

  validates :laptime, presence: true
  validates :team_id, presence: true
  validates :heat_id, presence: true

  validates_uniqueness_of :team_id, scope: :heat_id
end
