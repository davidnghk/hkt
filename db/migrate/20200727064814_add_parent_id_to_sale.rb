class AddParentIdToSale < ActiveRecord::Migration[6.0]
  def change
    add_column :sales, :parent_id, :integer
  end
end
