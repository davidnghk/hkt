class AddContactToSale < ActiveRecord::Migration[6.0]
  def change
    add_column :sales, :contact, :string
    add_column :sales, :ship_contact, :string
  end
end
