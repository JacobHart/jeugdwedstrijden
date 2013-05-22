class Rower < ActiveRecord::Base
  has_many :rower_classifications
  has_many :teams, :through => :rower_classifications
  belongs_to :club

  validates :name, presence: true
  validates :age, presence: true
  validates :club_id, presence: true

  validates :name, uniqueness: true

end
