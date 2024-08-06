class CreateTaskMaterials < ActiveRecord::Migration[6.0]
  def change
    create_table :task_materials do |t|
      t.references :task, null: true, foreign_key: true
      t.integer :material_id
      t.integer :quantity
      t.integer :cost

      t.timestamps
    end
  end
end
