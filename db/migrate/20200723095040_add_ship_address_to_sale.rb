class AddShipAddressToSale < ActiveRecord::Migration[6.0]
  def change
    add_column :sales, :ship_to, :string
    add_column :sales, :ship_address, :string
  end
end
