class CreateAssignmentItems < ActiveRecord::Migration[6.0]
  def change
    create_table :assignment_items do |t|
      t.references :assignment, null: false, foreign_key: true
      t.references :work_item
      t.integer :rating
      t.string :remarks

      t.timestamps
    end
  end
end
