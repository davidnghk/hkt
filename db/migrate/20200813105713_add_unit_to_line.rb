class AddUnitToLine < ActiveRecord::Migration[6.0]
  def change
    add_column :lines, :unit, :string
  end
end
