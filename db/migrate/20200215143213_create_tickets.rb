class CreateTickets < ActiveRecord::Migration[6.0]
  def change
    create_table :tickets do |t|
      t.integer :no
      t.references :user, null: false, foreign_key: true
      t.integer :actor_id
      t.string :message
      t.integer :notifiable_id
      t.string :notifiable_type

      t.timestamps
    end
  end
end
