class CreateIdtypes < ActiveRecord::Migration
  def self.up
    create_table :idtypes do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :idtypes
  end
end
