class CreateAssignees < ActiveRecord::Migration[6.0]
  def change
    create_table :assignees do |t|
      t.references :assignment, null: false, foreign_key: true
      t.references :team, null: false, foreign_key: true
      t.integer :role_id

      t.timestamps
    end
  end
end
