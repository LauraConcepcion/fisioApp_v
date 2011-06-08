class AddReferencesToPacienteIdToClinicalhistories < ActiveRecord::Migration
  def self.up
    add_column :clinicalhistories, :paciente_id, :integer
  end

  def self.down
    remove_column :clinicalhistories, :paciente_id
  end
end
