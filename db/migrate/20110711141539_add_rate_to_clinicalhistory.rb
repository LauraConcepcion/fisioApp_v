class AddRateToClinicalhistory < ActiveRecord::Migration
  def self.up
    add_column :clinicalhistories, :rate_id, :integer
  end

  def self.down
    remove_column :clinicalhistories, :rate_id
  end
end
