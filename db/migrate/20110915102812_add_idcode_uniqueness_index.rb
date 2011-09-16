class AddIdcodeUniquenessIndex < ActiveRecord::Migration
  def self.up
    add_index :idcode, :unique => true
  end

  def self.down
    remove_index :idcode
  end
end
