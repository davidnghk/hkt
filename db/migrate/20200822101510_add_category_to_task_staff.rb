class AddCategoryToTaskStaff < ActiveRecord::Migration[6.0]
  def change
    add_column :task_staffs, :category, :string
    add_column :task_staffs, :booking_date, :date
  end
end
