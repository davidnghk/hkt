class AddCommodityIdToThing < ActiveRecord::Migration[6.0]
  def change
    add_column :things, :commodity_id, :integer
  end
end
