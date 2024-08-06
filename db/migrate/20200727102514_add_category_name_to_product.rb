class AddCategoryNameToProduct < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :category_name, :string
    add_column :products, :unit_name, :string
  end
end
