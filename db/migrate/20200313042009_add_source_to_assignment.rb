class AddSourceToAssignment < ActiveRecord::Migration[6.0]
  def change
    add_column :assignments, :source, :string
  end
end
