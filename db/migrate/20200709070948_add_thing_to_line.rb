class AddThingToLine < ActiveRecord::Migration[6.0]
  def change
    add_column :lines, :thing, :string
  end
end
