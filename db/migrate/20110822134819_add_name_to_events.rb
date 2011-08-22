class AddNameToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :name, :string
    add_column :events, :firstsurname, :string
    add_column :events, :secondsurname, :string
  end

  def self.down
    remove_column :events, :secondsurname
    remove_column :events, :firstsurname
    remove_column :events, :name
  end
end
