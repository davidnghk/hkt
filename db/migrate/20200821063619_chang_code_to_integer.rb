class ChangCodeToInteger < ActiveRecord::Migration[6.0]
  def change
    change_column :terms, :code, :integer
  end
end
