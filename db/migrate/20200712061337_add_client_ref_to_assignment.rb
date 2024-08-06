class AddClientRefToAssignment < ActiveRecord::Migration[6.0]
  def change
    add_column :assignments, :client_ref, :string
  end
end
