class TeamClassification < ActiveRecord::Base
  belongs_to :team
  belongs_to :heat
  belongs_to :boat
end
