class RemoveWorkflowFromWork < ActiveRecord::Migration[6.0]
  def change
    remove_column :works, :workflow
    add_column :works, :workflow_id, :integer
  end
end