class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.string :boat_type_id
      t.string :club_id
    end
  end
end
