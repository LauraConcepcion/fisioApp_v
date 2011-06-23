class AddPacienteIdColumnToEvent < ActiveRecord::Migration
  def self.up
    add_column :events, :paciente_id, :integer
  end

  def self.down
    remove_column :events, :paciente_id
  end
end
