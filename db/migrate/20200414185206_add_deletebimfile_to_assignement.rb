class AddDeletebimfileToAssignement < ActiveRecord::Migration[6.0]
  def change
    add_column :assignments, :delete_bimfile, :boolean
  end
end
