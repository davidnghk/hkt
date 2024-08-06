class CreateAssignments < ActiveRecord::Migration[6.0]
  def change
    create_table :assignments do |t|
      t.integer :work_id
      t.references :location, null: false, foreign_key: true
      t.references :team, null: false, foreign_key: true
      t.integer :operation_team_id
      t.string :name
      t.datetime :start_datetime
      t.datetime :due_datetime
      t.datetime :end_datetime
      t.integer :status
      t.string :aasm_state
      t.integer :aasm_supplement
      t.integer :ref_no
      t.string :ancestry
      t.string :user_ref
      t.integer :parent_id
      t.text :comments
      t.string :color
      t.string :date_range
      t.string :address
      t.decimal :longitude, precision: 10, scale: 6
      t.decimal :altitude, precision: 10, scale: 6
      t.decimal :latitude, precision: 10, scale: 6
      t.string :block_hash
      t.integer :nonce

      t.timestamps
    end
  end
end
