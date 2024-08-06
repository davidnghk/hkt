class AddPercentageToLine < ActiveRecord::Migration[6.0]
  def change
    add_column :lines, :percentage, :integer, default: 0  
  end
end
