class CreateEntries < ActiveRecord::Migration
  def self.up
    create_table :entries do |t|
	  t.datetime :date
	  t.text :content
      t.timestamps
    end
  end

  def self.down
    drop_table :entries
  end
end
