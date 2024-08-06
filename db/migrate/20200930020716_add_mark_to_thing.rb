class AddMarkToThing < ActiveRecord::Migration[6.0]
  def change
    add_column :things, :mark, :string
  end
end
