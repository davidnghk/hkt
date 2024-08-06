class AddReportDateToTask < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :sample_received_date, :date
    add_column :tasks, :test_start_date, :date
    add_column :tasks, :test_end_date, :date 
    add_column :tasks, :report_drafted_date, :date
    add_column :tasks, :report_typed_date, :date
    add_column :tasks, :report_checked_date, :date
    add_column :tasks, :report_signed_date, :date
    add_column :tasks, :report_dispatched_date, :date
  end
end
 
