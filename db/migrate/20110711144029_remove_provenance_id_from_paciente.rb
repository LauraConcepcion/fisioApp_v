class RemoveProvenanceIdFromPaciente < ActiveRecord::Migration
  def self.up
    remove_column :pacientes, :provenance_id
  end

  def self.down
    add_column :pacientes, :provenance_id, :integer
  end
end
