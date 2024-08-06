class AddObjectToContainer < ActiveRecord::Migration[6.0]
  def change
    add_column :containers, :object, :string
    add_column :containers, :size, :string
  end
end
