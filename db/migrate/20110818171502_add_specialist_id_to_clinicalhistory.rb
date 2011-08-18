class AddSpecialistIdToClinicalhistory < ActiveRecord::Migration
  def self.up
    add_column :clinicalhistories, :specialist_id, :integer
  end

  def self.down
    remove_column :clinicalhistories, :specialist_id
  end
end
