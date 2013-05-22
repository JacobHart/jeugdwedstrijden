class Heat < ActiveRecord::Base
  has_many :team_classifications
  has_many :boats, :through => :team_classifications
  has_many :teams, :through => :team_classifications
  has_many :results

  validates :name, presence: true
  validates :name, uniqueness: true
end
