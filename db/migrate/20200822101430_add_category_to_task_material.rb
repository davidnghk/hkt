class AddCategoryToTaskMaterial < ActiveRecord::Migration[6.0]
  def change
    add_column :task_materials, :category, :string
    add_column :task_materials, :booking_date, :date
  end
end
