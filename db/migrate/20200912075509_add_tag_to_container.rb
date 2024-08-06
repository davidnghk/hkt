class AddTagToContainer < ActiveRecord::Migration[6.0]
  def change
    add_column :containers, :tag, :string
  end
end
