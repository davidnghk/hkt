class AddNameToTask < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :name, :string
    add_column :tasks, :size, :string
    change_column_default :tasks, :category, 0
  end
end
