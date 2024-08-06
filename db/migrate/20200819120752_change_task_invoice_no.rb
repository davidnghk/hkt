class ChangeTaskInvoiceNo < ActiveRecord::Migration[6.0]
  def change
    rename_column :tasks, :invoicec_no, :invoice_no 
  end
end
