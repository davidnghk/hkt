class ChangeTaskAccountDate < ActiveRecord::Migration[6.0]
  def change
    change_column :tasks, :laboratory_signoff_date, :date
  end
end
