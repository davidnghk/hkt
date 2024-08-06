class AddSiteToClient < ActiveRecord::Migration[6.0]
  def change
    add_column :clients, :site, :string
  end
end
