class AddReadAtToTicket < ActiveRecord::Migration[6.0]
  def change
    add_column :tickets, :read_at, :datetime
  end
end
