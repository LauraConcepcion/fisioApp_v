class AddProvenanceIdToPaciente < ActiveRecord::Migration
  def self.up
    add_column :pacientes, :provenance_id, :integer
  end

  def self.down
    remove_column :pacientes, :provenance_id
  end
end
