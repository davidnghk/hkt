class AddDiscountToLine < ActiveRecord::Migration[6.0]
  def change
    add_column :lines, :discount, :decimal, precision: 5, scale: 2
  end
end
