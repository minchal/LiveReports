class RenameTable < ActiveRecord::Migration
    def self.up
        rename_table :users, :our_users
    end 
    def self.down
        rename_table :users, :our_users
    end
 end
