class CreateWorkItems < ActiveRecord::Migration[6.0]
  def change
    create_table :work_items do |t|
      t.references :work, null: false, foreign_key: true
      t.string :code
      t.string :name
      t.string :local_name
      t.integer :parent_id

      t.timestamps
    end
  end
end
