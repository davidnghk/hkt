class CreateDefects < ActiveRecord::Migration[6.0]
  def change
    create_table :defects do |t|
      t.references :assignment, null: false, foreign_key: true
      t.integer :issue_id
      t.integer :rating
      t.string :remarks

      t.timestamps
    end
  end
end
