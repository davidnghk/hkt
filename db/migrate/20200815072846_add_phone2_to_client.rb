class AddPhone2ToClient < ActiveRecord::Migration[6.0]
  def change
    add_column :clients, :phone2, :string
  end
end
