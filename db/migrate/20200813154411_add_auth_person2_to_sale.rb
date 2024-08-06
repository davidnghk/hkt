class AddAuthPerson2ToSale < ActiveRecord::Migration[6.0]
  def change
    add_column :sales, :authorised_person2, :string
  end
end
