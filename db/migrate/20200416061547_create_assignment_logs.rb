class CreateAssignmentLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :assignment_logs do |t|
      t.references :assignment, null: false, foreign_key: true
      t.integer :actor_id
      t.string :action
      t.integer :team_id
      t.integer :operation_team_id

      t.timestamps
    end
  end
end
