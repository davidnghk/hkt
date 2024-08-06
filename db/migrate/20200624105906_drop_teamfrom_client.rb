class DropTeamfromClient < ActiveRecord::Migration[6.0]
  def change
  	remove_column :clients, :team_id
  end
end
