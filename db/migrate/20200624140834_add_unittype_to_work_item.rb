class AddUnittypeToWorkItem < ActiveRecord::Migration[6.0]
  def change
    add_column :work_items, :unit_type_id, :integer
    remove_column :work_items, :unit
  end
end
