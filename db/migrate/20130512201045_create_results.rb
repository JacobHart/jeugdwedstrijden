class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.string :rank
      t.string :laptime
      t.string :team_id
    end
  end
end
