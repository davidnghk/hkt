class CreateCollections < ActiveRecord::Migration[6.0]
  def change
    create_table :collections do |t|
      t.string :customer_contract_no
      t.string :request_ref
      t.string :location
      t.string :title

      t.timestamps
    end
  end
end
