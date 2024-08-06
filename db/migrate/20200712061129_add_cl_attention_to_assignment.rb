class AddClAttentionToAssignment < ActiveRecord::Migration[6.0]
  def change
    add_column :assignments, :project_site, :string
    add_column :assignments, :attention, :string
    add_column :assignments, :phone, :string
  end
end
