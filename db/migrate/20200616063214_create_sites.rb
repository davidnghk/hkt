class CreateSites < ActiveRecord::Migration[6.0]
  def change
    create_table :sites do |t|
      t.references :client, null: false, foreign_key: true
      t.string :code
      t.string :name
      t.string :local_name

      t.timestamps
    end
  end
end
