class AddLaboratoryToTask < ActiveRecord::Migration[6.0]
  def change
    add_reference :tasks, :laboratory, null: true, foreign_key: true
    add_reference :tasks, :client, null: true, foreign_key: true
    add_column :tasks, :sample, :string
    add_column :tasks, :contact, :string
    add_column :tasks, :phone, :string
    add_column :tasks, :fax, :string
  end
end
