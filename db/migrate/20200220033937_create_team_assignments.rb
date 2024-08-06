class CreateTeamAssignments < ActiveRecord::Migration[6.0]
  def change
    create_table :team_assignments do |t|
      t.references :team, null: false, foreign_key: true
      t.references :assignment, null: false, foreign_key: true
      t.integer :role_id

      t.timestamps
      t.index ["assignment_id"], name: "index_teams_on_assignment_id"
    end
  end
end
