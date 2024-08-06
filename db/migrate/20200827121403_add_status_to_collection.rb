class AddStatusToCollection < ActiveRecord::Migration[6.0]
  def change
    add_column :collections, :status, :integer, :default => 0
  end
end
