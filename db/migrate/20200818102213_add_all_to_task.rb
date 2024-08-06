class AddAllToTask < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :all_day, :boolean, default: true
    add_column :tasks, :start_time, :datetime
    add_column :tasks, :end_time, :datetime
    add_column :tasks, :title, :string
  end
end
