class AddClinicalhistoryIdToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :clinicalhistory_id, :integer
  end

  def self.down
    remove_column :events, :clinicalhistory_id
  end
end
