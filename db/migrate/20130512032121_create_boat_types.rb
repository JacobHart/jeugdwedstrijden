class CreateBoatTypes < ActiveRecord::Migration
  def change
    create_table :boat_types do |t|
      t.string :name
    end
  end
end
