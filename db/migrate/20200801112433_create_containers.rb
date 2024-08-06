class CreateContainers < ActiveRecord::Migration[6.0]
  def change
    create_table :containers do |t|
      t.references :task, null: false, foreign_key: true
      t.string :code
      t.integer :quantity

      t.timestamps
    end
  end
end
