class AddWorkflowToWork < ActiveRecord::Migration[6.0]
  def change
    add_column :works, :workflow, :integer, default: 0
    remove_column :works, :workflow_id
  end
end
