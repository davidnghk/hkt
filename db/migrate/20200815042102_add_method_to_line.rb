class AddMethodToLine < ActiveRecord::Migration[6.0]
  def change
    add_column :lines, :method, :string
  end
end
