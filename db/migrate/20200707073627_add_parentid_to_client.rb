class AddParentidToClient < ActiveRecord::Migration[6.0]
  def change
    add_column :clients, :parent_id, :integer
  end
end
