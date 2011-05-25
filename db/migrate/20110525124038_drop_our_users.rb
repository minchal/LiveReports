class DropOurUsers < ActiveRecord::Migration
  def self.up
  drop_table :our_users
  end

  def self.down
  end
end
