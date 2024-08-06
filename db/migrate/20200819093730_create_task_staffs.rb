class CreateTaskStaffs < ActiveRecord::Migration[6.0]
  def change
    create_table :task_staffs do |t|
      t.references :task, null: true, foreign_key: true
      t.integer :task_role_id
      t.integer :staff_id
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
