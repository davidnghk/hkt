class AddInvoiceToTask < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :report_no, :string
    add_column :tasks, :quotation_no, :string
    add_column :tasks, :invoicec_no, :string
    add_column :tasks, :invoice_date, :date
    add_column :tasks, :invoice_amount, :integer
    add_column :tasks, :account_signoff_date, :date
    add_column :tasks, :laboratory_signoff_date, :string
  end
end
