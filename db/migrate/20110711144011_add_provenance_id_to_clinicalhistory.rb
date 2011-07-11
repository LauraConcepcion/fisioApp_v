class AddProvenanceIdToClinicalhistory < ActiveRecord::Migration
  def self.up
    add_column :clinicalhistories, :provenance_id, :integer
  end

  def self.down
    remove_column :clinicalhistories, :provenance_id
  end
end
