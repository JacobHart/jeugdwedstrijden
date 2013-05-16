class CreateBoats < ActiveRecord::Migration
  def change
    create_table :boats do |t|
      t.string :name
    end
  end
end
