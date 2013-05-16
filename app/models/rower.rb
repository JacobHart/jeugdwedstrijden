class Rower < ActiveRecord::Base
  has_many :rower_classifications
  has_many :teams, :through => :rower_classifications
  belongs_to :club

  validates :name, :age, :presence => true

end
