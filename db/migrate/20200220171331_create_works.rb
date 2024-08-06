class CreateWorks < ActiveRecord::Migration[6.0]
  def change
    create_table :works do |t|
      t.references :team, null: false, foreign_key: true
      t.string :code
      t.string :name
      t.string :local_name
      t.integer :icon_id
      t.integer :workflow_id

      t.timestamps
    end
  end
end
