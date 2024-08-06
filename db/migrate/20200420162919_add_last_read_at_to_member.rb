class AddLastReadAtToMember < ActiveRecord::Migration[6.0]
  def change
    add_column :members, :last_read_at, :datetime
  end
end
