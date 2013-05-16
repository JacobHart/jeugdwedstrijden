class CreateHeats < ActiveRecord::Migration
  def change
    create_table :heats do |t|
      t.string :name
    end
  end
end
