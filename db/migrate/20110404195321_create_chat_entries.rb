class CreateChatEntries < ActiveRecord::Migration
  def self.up
    create_table :chat_entries do |t|
	  t.datetime :date
	  t.text :content
      t.timestamps
    end
  end

  def self.down
    drop_table :chat_entries
  end
end
