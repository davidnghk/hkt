class AddShipToSale < ActiveRecord::Migration[6.0]
  def change
    add_column :sales, :ship_client_id, :integer
    add_column :sales, :ship_project_site, :string
    add_column :sales, :ship_attention, :string
    add_column :sales, :ship_phone, :string
  end
end
