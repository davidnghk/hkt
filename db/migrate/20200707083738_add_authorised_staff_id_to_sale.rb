class AddAuthorisedStaffIdToSale < ActiveRecord::Migration[6.0]
  def change
    add_column :sales, :authorised_staff_id, :integer
  end
end
