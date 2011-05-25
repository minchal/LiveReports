class AddUserIdToChatEntries < ActiveRecord::Migration
  def self.up
    add_column :chat_entries, :user_id, :integer
  end

  def self.down
    remove_column :chat_entries, :user_id
  end
end
