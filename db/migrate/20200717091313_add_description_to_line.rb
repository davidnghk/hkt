class AddDescriptionToLine < ActiveRecord::Migration[6.0]
  def change
    add_column :lines, :description, :string
  end
end
