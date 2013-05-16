class CreateRowers < ActiveRecord::Migration
  def change
    create_table :rowers do |t|
      t.string :name
      t.string :age
      t.string :club_id
    end
  end
end
