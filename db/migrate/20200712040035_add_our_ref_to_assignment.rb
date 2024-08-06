class AddOurRefToAssignment < ActiveRecord::Migration[6.0]
  def change
    add_column :assignments, :our_ref, :string
  end
end
