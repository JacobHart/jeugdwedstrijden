class Heat < ActiveRecord::Base
  has_many :team_classifications
  has_many :boats, :through => :team_classifications
  has_many :teams, :through => :team_classifications
  has_many :results
end
