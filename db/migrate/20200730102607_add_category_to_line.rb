class AddCategoryToLine < ActiveRecord::Migration[6.0]
  def change
    add_column :lines, :category, :string
  end
end
