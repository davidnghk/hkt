class AddPhotoidToPhoto < ActiveRecord::Migration[6.0]
  def change
    add_index :photos, :photoable_id
  end
end
