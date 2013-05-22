class Club < ActiveRecord::Base
  has_many :teams
  has_many :rowers

  validates :name, presence: true
  validates :name, uniqueness: true
end
