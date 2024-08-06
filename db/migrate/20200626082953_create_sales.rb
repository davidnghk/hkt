class CreateSales < ActiveRecord::Migration[6.0]
  def change
    create_table :sales do |t|
      t.references :team, null: false, foreign_key: true
      t.integer :category
      t.date :sale_date
      t.string :our_ref
      t.string :client_ref
      t.references :client, null: false, foreign_key: true
      t.string :project_site
      t.string :attention
      t.string :phone
      t.decimal :total_amount, precision: 10, scale: 2
      t.string :authorised_person
      t.date :authorised_date
      t.string :aasm_state

      t.timestamps
    end
  end
end
