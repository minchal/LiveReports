class Fixcolumnname1 < ActiveRecord::Migration
  def self.up
  rename_column :media, :type, :mtype
  end

  def self.down
  end
end
