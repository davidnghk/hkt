class AddReceivedToCollection < ActiveRecord::Migration[6.0]
  def change
    add_column :collections, :received_date, :date
  end
end
