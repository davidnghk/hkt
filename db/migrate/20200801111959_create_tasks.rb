class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.integer :category
      t.date :task_date
      t.string :our_ref
      t.string :customer_ref
      t.string :request_ref
      t.string :location
      t.integer :object_type

      t.timestamps
    end
  end
end
