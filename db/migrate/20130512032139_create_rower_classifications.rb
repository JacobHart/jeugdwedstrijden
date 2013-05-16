class CreateRowerClassifications < ActiveRecord::Migration
  def change
    create_table :rower_classifications do |t|
      t.string :rower_id
      t.string :team_id
    end
  end
end
