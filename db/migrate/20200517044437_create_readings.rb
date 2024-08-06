class CreateReadings < ActiveRecord::Migration[6.0]
  def change
    create_table :readings do |t|
      t.string :thing
      t.datetime :reading_time
      t.string :content
      t.integer :thing_id

      t.timestamps
    end
  end
end
