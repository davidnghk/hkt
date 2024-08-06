class AddHeadingToWorkItem < ActiveRecord::Migration[6.0]
  def change
    add_column :work_items, :heading, :string
  end
end
