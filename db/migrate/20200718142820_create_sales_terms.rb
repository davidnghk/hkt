class CreateSalesTerms < ActiveRecord::Migration[6.0]
  def change
    create_table :sales_terms do |t|
      t.references :sale, null: false, foreign_key: true
      t.references :term, null: false, foreign_key: true

      t.timestamps
    end
  end
end
