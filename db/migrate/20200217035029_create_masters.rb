class CreateMasters < ActiveRecord::Migration[6.0]
  def change
    create_table :masters do |t|
      t.references :team, null: false, foreign_key: true
      t.string :code
      t.string :name
      t.string :local_name
      t.integer :parent_id
      t.string :icon
      t.integer :setting1
      t.string :param1

      t.timestamps
    end
  end
end
