class ChangeKeyColumnsToIntergerType < ActiveRecord::Migration

  def change
    schema = [
      { table_name: :results, column: :heat_id },
      { table_name: :results, column: :team_id },
      { table_name: :rower_classifications, column: :rower_id },
      { table_name: :rower_classifications, column: :team_id },
      { table_name: :rowers, column: :club_id },
      { table_name: :team_classifications, column: :team_id },
      { table_name: :team_classifications, column: :heat_id },
      { table_name: :team_classifications, column: :boat_id },
      { table_name: :teams, column: :boat_type_id },
      { table_name: :teams, column: :club_id }
    ]

    schema.each do |layout|
      remove_column layout[:table_name], layout[:column]
      add_column layout[:table_name], layout[:column], :integer
    end

    remove_column :results, :rank
    add_column :results, :rank, :integer
    remove_column :results, :laptime
    add_column :results, :laptime, :float


  end
end
