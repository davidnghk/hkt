class AddOrignToAssignment < ActiveRecord::Migration[6.0]
  def change
    add_column :assignments, :origin, :string
  end
end
