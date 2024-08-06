class AddAddressToClient < ActiveRecord::Migration[6.0]
  def change
    add_column :clients, :address1, :string
    add_column :clients, :address2, :string
    add_column :clients, :address3, :string
    add_column :clients, :address4, :string
    add_column :clients, :phone, :string
    add_column :clients, :fax, :string
    add_column :clients, :email, :string
    add_column :clients, :local_address, :string
  end
end
