class AddIndexToSale < ActiveRecord::Migration[6.0]
  def change
    add_index :sales, :our_ref
    add_index :sales, :client_ref
  end
end
