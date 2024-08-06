class AddSerialNoToAssignmentItem < ActiveRecord::Migration[6.0]
  def change
    add_column :assignment_items, :serial_number, :string
  end
end
