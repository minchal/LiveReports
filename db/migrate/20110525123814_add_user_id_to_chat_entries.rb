class AddUserIdToChatEntries < ActiveRecord::Migration
  def self.up
    add_column :chat_entries, :user_id, :integer
    add_column :chat_entries, :report_id, :integer
  end

  def self.down
    remove_column :chat_entries, :user_id
    remove_column :chat_entries, :report_id
  end
end
