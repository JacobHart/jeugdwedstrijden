class BoatType < ActiveRecord::Base
  has_many :teams

  validates :name, presence: true
  validates :name, uniqueness: true
end
