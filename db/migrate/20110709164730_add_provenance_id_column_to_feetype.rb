class AddProvenanceIdColumnToFeetype < ActiveRecord::Migration
  def self.up
    add_column :feetypes, :provenance_id, :integer
  end

  def self.down
    remove_column :feetypes, :provenance_id
  end
end
