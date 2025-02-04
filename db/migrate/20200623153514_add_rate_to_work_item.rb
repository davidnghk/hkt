class AddRateToWorkItem < ActiveRecord::Migration[6.0]
  def change
    add_column :work_items, :unit, :integer
    add_column :work_items, :unit_rate, :decimal, precision: 10, scale: 2
  end
end
