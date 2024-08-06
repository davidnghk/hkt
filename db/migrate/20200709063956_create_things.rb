class CreateThings < ActiveRecord::Migration[6.0]
  def change
    create_table :things do |t|
      t.references :thingable, polymorphic: true, null: true 
      t.string :code
      t.string :cname
      t.string :local_name
      t.integer :category_id
      t.integer :parent_id

      t.timestamps
    end
  end
end
