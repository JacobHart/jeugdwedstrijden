class RowerClassification < ActiveRecord::Base
  belongs_to :rower
  belongs_to :team

  validates :rower_id, presence: true
  validates :team_id, presence: true

end
