class AddCollectionToContainer < ActiveRecord::Migration[6.0]
  def change
    add_reference :containers, :collection, null: true, foreign_key: true
  end
end
