class AddAttendedColumnToEvent < ActiveRecord::Migration
  def self.up
    add_column :events, :attended, :boolean
  end

  def self.down
    remove_column :events, :attended
  end
end
