class AddAncestryToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :ancestry, :string
    add_index :products, :ancestry
  end
end
