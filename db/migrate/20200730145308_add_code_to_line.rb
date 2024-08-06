class AddCodeToLine < ActiveRecord::Migration[6.0]
  def change
    add_column :lines, :code, :string
  end
end
