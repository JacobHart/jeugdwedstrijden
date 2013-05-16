class Club < ActiveRecord::Base
  has_many :teams
  has_many :rowers
end
