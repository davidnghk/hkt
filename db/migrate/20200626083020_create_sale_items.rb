class CreateSaleItems < ActiveRecord::Migration[6.0]
  def change
    create_table :sale_items do |t|
      t.references :sale, null: false, foreign_key: true
      t.references :work_item, null: false, foreign_key: true
      t.decimal :price, precision: 10, scale: 2
      t.integer :quantity
      t.decimal :amount, precision: 10, scale: 2
      t.timestamps
    end
  end
end
