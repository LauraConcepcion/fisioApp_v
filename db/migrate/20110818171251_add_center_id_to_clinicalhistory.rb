class AddCenterIdToClinicalhistory < ActiveRecord::Migration
  def self.up
    add_column :clinicalhistories, :center_id, :integer
  end

  def self.down
    remove_column :clinicalhistories, :center_id
  end
end
