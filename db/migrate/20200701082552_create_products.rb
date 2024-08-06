class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :code
      t.string :name
      t.string :local_name
      t.integer :unit_rate
      t.integer :unit_type_id
      t.integer :parent_id

      t.timestamps
    end
  end
end
