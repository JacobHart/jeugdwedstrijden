class CreateTeamClassifications < ActiveRecord::Migration
  def change
    create_table :team_classifications do |t|
      t.string :team_id
      t.string :heat_id
      t.string :boat_id
    end
  end
end
