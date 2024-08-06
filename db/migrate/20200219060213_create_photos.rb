class CreatePhotos < ActiveRecord::Migration[6.0]
  def change
    create_table :photos do |t|
      t.integer :category
      t.string :image
      t.decimal :longitude, precision: 15, scale: 8
      t.decimal :altitude, precision: 15, scale: 8
      t.decimal :latitude, precision: 15, scale: 8
      t.string :photoable_type
      t.bigint :photoable_id
      t.boolean :is_printable
      t.datetime :photo_datetime

      t.timestamps
    end
  end
end
