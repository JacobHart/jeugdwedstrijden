class AddHeatIdToResults < ActiveRecord::Migration
  def change
    add_column :results, :heat_id, :string
  end
end
