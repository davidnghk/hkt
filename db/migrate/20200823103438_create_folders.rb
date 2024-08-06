class CreateFolders < ActiveRecord::Migration[6.0]
  def change
    create_table :folders do |t|
      t.references :foldable, polymorphic: true, null: false
      t.string :code
      t.string :name
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
