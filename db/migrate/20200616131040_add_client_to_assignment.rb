class AddClientToAssignment < ActiveRecord::Migration[6.0]
  def change
    add_reference :assignments, :client, null: true, foreign_key: true
    add_reference :assignments, :site, null: true, foreign_key: true
  end
end
