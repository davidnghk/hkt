class AddTermToSale < ActiveRecord::Migration[6.0]
  def change
    add_column :sales, :term_id, :integer
  end
end
