class AddFkToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :center_id, :integer
    add_column :events, :specialist_id, :integer
  end

  def self.down
    remove_column :events, :specialist_id
    remove_column :events, :center_id
  end
end
