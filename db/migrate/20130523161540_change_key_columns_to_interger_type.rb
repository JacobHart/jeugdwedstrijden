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

    # change_column :results, :heat_id, :integer
    # change_column :results, :team_id, :integer
    # change_column :rower_classifications, :rower_id, :integer
    # change_column :rower_classifications, :team_id, :integer
    # change_column :rowers, :club_id, :integer
    # change_column :team_classifications, :team_id, :integer
    # change_column :team_classifications, :heat_id, :integer
    # change_column :team_classifications, :boat_id, :integer
    # change_column :teams, :boat_type_id, :integer
    # change_column :teams, :club_id, :integer
  end
end
