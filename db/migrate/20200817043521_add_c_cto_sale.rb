class AddCCtoSale < ActiveRecord::Migration[6.0]
  def change
    add_column :sales, :cc, :string
  end
end
