class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
      t.string :code
      t.string :name
      t.string :local_name
      t.string :parent_id

      t.timestamps
    end
  end
end
