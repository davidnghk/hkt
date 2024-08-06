class AddFaxToSale < ActiveRecord::Migration[6.0]
  def change
    add_column :sales, :fax, :string
    add_column :sales, :email, :string
  end
end
