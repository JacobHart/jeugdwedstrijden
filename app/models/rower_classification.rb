class RowerClassification < ActiveRecord::Base
  belongs_to :rower
  belongs_to :team
end
