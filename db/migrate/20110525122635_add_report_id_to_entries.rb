class AddReportIdToEntries < ActiveRecord::Migration
  def self.up
    add_column :entries, :report_id, :integer
  end

  def self.down
    remove_column :entries, :report_id
  end
end
