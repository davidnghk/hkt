class CreateCommodities < ActiveRecord::Migration[6.0]
  def change
    create_table :commodities do |t|
      t.string :code
      t.string :tag
      t.string :name
      t.string :local_name

      t.timestamps
    end
  end
end
