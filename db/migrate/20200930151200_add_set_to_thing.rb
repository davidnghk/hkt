class AddSetToThing < ActiveRecord::Migration[6.0]
  def change
    add_column :things, :set_no, :string
  end
end
