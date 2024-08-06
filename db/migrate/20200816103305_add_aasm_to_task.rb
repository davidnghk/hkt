class AddAasmToTask < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :aasm_state, :string
    add_column :tasks, :no_of_sample, :integer
  end
end
