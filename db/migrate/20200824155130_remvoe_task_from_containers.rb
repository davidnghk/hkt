class RemvoeTaskFromContainers < ActiveRecord::Migration[6.0]
  def change
    remove_reference :containers, :task, index: true, foreign_key: true
  end
end
