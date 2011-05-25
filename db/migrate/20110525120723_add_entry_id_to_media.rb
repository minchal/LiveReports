class AddEntryIdToMedia < ActiveRecord::Migration
  def self.up
    add_column :media, :entry_id, :integer
  end

  def self.down
    remove_column :media, :entry_id
  end
end
